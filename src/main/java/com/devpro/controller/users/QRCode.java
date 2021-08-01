package com.devpro.controller.users;

import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import com.devpro.entities.SaleOrder;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRCode {
	
	private String QRCODE_PATH="C:\\Users\\ACER\\Documents\\workspace-spring-tool-suite-4-4.11.0.RELEASE\\fastsneaker\\upload";
	
	public String writeQRCode(SaleOrder saleOrder) throws Exception {
		String qrcode = QRCODE_PATH + saleOrder.getCustomerName() + "-QRCODE.png";
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix bitMatrix = writer.encode(
				saleOrder.getCustomerName()+"\n"+
				saleOrder.getCustomerEmail()+"\n"+
				saleOrder.getCustomerAddress()+"\n"+
				saleOrder.getCustomerPhone()+"\n"+
				saleOrder.getTotalVN()
				, BarcodeFormat.QR_CODE, 350, 350);
		Path path = FileSystems.getDefault().getPath(qrcode);
		MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
		return "QRCODE is generated successfully....";		
	}
}
