package com.financialPeaceUniversity.utilities;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;


public class ConfigurationReader {

    private static Properties properties = new Properties();

    static {
        // Introducing static block to run code in static block before anything else.
        try {
            // adding configuration.properties
            FileInputStream file = new FileInputStream("configuration.properties");
            // Loading configuration.properties file into Java memory
            properties.load(file);
            // Closing the file after loading into Java
            file.close();
        } catch (IOException e) {
            System.out.println("FILE NOT FOUND WITH GIVEN PATH!!!");
            e.printStackTrace();
        }
    }

    // getter method to read from configuration.properties file.
    public static String getProperty(String property) {
        return properties.getProperty(property);
    }


}
