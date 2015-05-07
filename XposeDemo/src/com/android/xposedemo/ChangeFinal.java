package com.android.xposedemo;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class ChangeFinal {

	static void setFinalStatic(Field field, Object newValue) throws Exception {  
        field.setAccessible(true);  
        try {
        	 Field modifiersField = Field.class.getDeclaredField("modifiers");  
             modifiersField.setAccessible(true);  
             modifiersField.setInt(field, field.getModifiers() & ~Modifier.FINAL); 
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        field.set(null, newValue);  
    }  
}
