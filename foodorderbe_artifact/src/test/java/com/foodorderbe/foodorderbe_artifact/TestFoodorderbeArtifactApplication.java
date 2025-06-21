package com.foodorderbe.foodorderbe_artifact;

import org.springframework.boot.SpringApplication;

public class TestFoodorderbeArtifactApplication {

	public static void main(String[] args) {
		SpringApplication.from(FoodorderbeArtifactApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
