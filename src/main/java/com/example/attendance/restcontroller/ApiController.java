package com.example.attendance.restcontroller;

import java.lang.reflect.Array;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.attendance.model.TestModel;

@RestController
public class ApiController {
	
	@GetMapping("/api/get")
	public Map<String, String> getdata() {
		TestModel testModel = new TestModel();
		return testModel.Test();
	}
	
	@GetMapping("/api/getList")
	public List<String[]> getList() {
		List<String[]> list = new LinkedList<String[]>();
		
//		Table Head
		String[] arr1 = {"id", "First", "Last", "Handle"};
        list.add(arr1);
        
//      Table Body
        String[] arr2 = {"1","Mark","Otto","@mdo"};
        list.add(arr2);
        
        String[] arr3 = {"2","Jacob","Thornton","@twitter"};
        list.add(arr3);
        
        String[] arr4 = {"3","Jacob1","Thornton1","@twitter1"};
        list.add(arr4);
        
		return list;
	}
	
}
