package config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GlobalClass {

	public String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashedBytes = md.digest(password.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : hashedBytes) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Error hashing password", e);
		}
	}

	public static void main(String[] args) {
		GlobalClass globalClass = new GlobalClass();
		String password = "testadmin";
		String hashedPassword = globalClass.hashPassword(password);
		System.out.println("Original Password: " + password);
		System.out.println("Hashed Password: " + hashedPassword);
	}

}
