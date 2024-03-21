package com.example.attendance.model;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHashing {

    // Hashes a password using bcrypt
    public static String hashPassword(String password) {
        // Generate a salt for bcrypt
        String salt = BCrypt.gensalt(12); // The strength parameter (12) specifies the log2 of the number of rounds of hashing
        
        // Hash the password using the generated salt
        String hashedPassword = BCrypt.hashpw(password, salt);
        
        return hashedPassword;
    }
    
    // Verifies a password against its hash
    public static boolean verifyPassword(String password, String hashedPassword) {
        // Check if the provided password matches the hash
        return BCrypt.checkpw(password, hashedPassword);
    }
}
