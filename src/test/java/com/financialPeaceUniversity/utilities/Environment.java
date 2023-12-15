package com.financialPeaceUniversity.utilities;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Environment {

    public static final String FPU_PAGE_URL;
    public static final String USER_EMAIL;
    public static final String USER_PASSWORD;

    static {

        Properties properties = null;
        String environment = System.getProperty("environment") == null ? System.getProperty("environment") : ConfigurationReader.getProperty("environment");

        try {
            String path = System.getProperty("user.dir") + "/src/test/resources/environment/" + environment + ".properties";
            FileInputStream file = new FileInputStream(path);
            properties = new Properties();
            properties.load(file);
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        FPU_PAGE_URL = properties.getProperty("financialPeaceUniversityUrl");
        USER_EMAIL = properties.getProperty("userEmail");
        USER_PASSWORD = properties.getProperty("userPassword");
    }

}
