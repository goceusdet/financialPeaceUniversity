package com.financialPeaceUniversity.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "rerun:target/rerun.txt",
                "me.jvt.cucumber.report.PrettyReports:target/cucumber",
                "html:target/cucumber-reports.html"
        },
        features = "src/test/resources/features",
        glue = "com/financialPeaceUniversity/stepDefinitions",
        dryRun = true,
        tags = "",
        publish = true
)
public class MainRunner {}
