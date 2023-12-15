package com.financialPeaceUniversity.stepDefinitions;

import com.financialPeaceUniversity.utilities.Driver;
import com.financialPeaceUniversity.utilities.Environment;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;


public class Hooks {

    @Before()
    public void setUp() {
        System.out.println("UI test is running:");
        Driver.getDriver().get(Environment.HOME_PAGE_URL);
    }

    @After()
    public void tearDown(Scenario scenario){
        if(scenario.isFailed()){
            byte[] screenshot = ((TakesScreenshot)Driver.getDriver()).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot,"image/png", "screenshot");
        }
        Driver.tearDown();
    }
}
