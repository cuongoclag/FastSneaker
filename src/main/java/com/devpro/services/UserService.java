package com.devpro.services;

import java.io.File;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.GeneratePassword;
import com.devpro.entities.Role;
import com.devpro.entities.User;
import com.devpro.repositories.RoleRepo;
import com.devpro.repositories.UserRepo;

@Service
public class UserService {
	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	public UserRepo userRepo;
	@Autowired
	public RoleRepo roleRepo;
	
	public User findUserByEmail(final String email) {
		try {
			String sql = "select * from tbl_users where email = '" + email + "'";
			Query query = entityManager.createNativeQuery(sql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public User findUserById(final int id) {

		String sql = "select * from tbl_users where id = '" + id + "'";
		Query query = entityManager.createNativeQuery(sql, User.class);
		return (User) query.getResultList().get(0);
	}

	public Role findRoleById(final int id) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

		String sql = "select * from tbl_roles where id = '" + id + "'";
		Query query = entityManager.createNativeQuery(sql, Role.class);
		return (Role) query.getSingleResult();
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;
		return false;
	}

	public User loadUserByUsername(String userName) {
		try {
			String jpql = "From User u Where u.username='" + userName + "'";
			Query query = entityManager.createQuery(jpql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateResetPasswordToken(String token, String email) {
		User user = findUserByEmail(email);
		
		if(user != null) {
			user.setResetPasswordToken(token);
			userRepo.save(user);
		} else {
			throw new UsernameNotFoundException("Could not find any user with email" + email);
		}
	}
	
	public User get(String resetPasswordToken) {
		return userRepo.findByResetPasswordToken(resetPasswordToken);
	}
	
	public void updatePassword(User user, String newPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(newPassword);
		
		user.setPassword(encodePassword);
		user.setResetPasswordToken(null);
		userRepo.save(user);
	}
	
	
	@Transactional(rollbackOn = Exception.class)
	public void saveUser(MultipartFile[] images, User user) throws Exception {
		try {
			if (user.getId() != null) { // chỉnh sửa
				// lấy dữ liệu cũ của sản phẩm
				User userInDb = userRepo.findById(user.getId()).get();
				// lấy danh sách ảnh của user cũ
				 String avatar = userInDb.getAvatar();
				if (!isEmptyUploadFile(images)) { // nếu admin sửa ảnh sản phẩm
					// xoá ảnh cũ đi
					 new File("C:\\Users\\ACER\\Documents\\workspace-spring-tool-suite-4-4.11.0.RELEASE\\fastsneaker\\upload_avt" + user.getAvatar()).delete();
				
				} else { // ảnh phải giữ nguyên
					user.setAvatar(avatar);
				}
			}
			if (!isEmptyUploadFile(images)) { // nếu admin upload ảnh
				for (MultipartFile image : images) {
					// Lưu file vào host.
					image.transferTo(new File(
							"C:\\Users\\ACER\\Documents\\workspace-spring-tool-suite-4-4.11.0.RELEASE\\fastsneaker\\upload_avt" + image.getOriginalFilename()));					
					user.setAvatar(image.getOriginalFilename());
				}
			}
			if(user.getCreatedDate() != null) {
				user.setUpdatedDate(java.time.LocalDateTime.now());
			}else {
				user.setCreatedDate(java.time.LocalDateTime.now());
			}

			userRepo.save(user);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Transactional(rollbackOn = Exception.class)
	public void saveGuestUser(User user) throws Exception {
		try {
			user.setPassword(GeneratePassword.GenerPass(user.getPassword()));
			user.getRoles().add(findRoleById(6));
			user.setUpdatedDate(java.time.LocalDateTime.now());
			user.setStatus(true);
			userRepo.save(user);
		} catch (Exception e) {
			throw e;
		}
	}

	public List<User> listAll() {
        return userRepo.findAll(Sort.by("email").ascending());
    }
}
