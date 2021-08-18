package com.devpro.common;

import javax.servlet.http.HttpServletRequest;

import com.github.slugify.Slugify;

public class Utilities {
	public static String createSeoLink(final String text) {
		Slugify slg = new Slugify();
		String result = slg.slugify(text + "-" + System.currentTimeMillis());
		return result;
		}
	public static String createSeoLinkCategory(final String text) {
		Slugify slg = new Slugify();
		String result = slg.slugify(text);
		return result;
		}
	
	public static String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}

}
