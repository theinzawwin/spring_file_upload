package com.bestbright.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bestbright.dto.StudentDTO;
import com.bestbright.services.StudentService;

@Controller
public class StudentController {

	 private static final String UPLOAD_DIRECTORY ="/images";  
	 @Autowired
	 StudentService studentService;
	@RequestMapping(value="/index.htm")
	public String saveFile(){
		
		return "new_student";
	}
	@RequestMapping(value="/question.htm")
	public String question(){
		
		return "auto_question";
	}
	@RequestMapping(value="save_file.htm",method=RequestMethod.POST)
	public String saveFile(@RequestParam CommonsMultipartFile file,HttpSession session,Model model){
		ServletContext context = session.getServletContext();  
	    String path = context.getRealPath(UPLOAD_DIRECTORY);   
        String filename=file.getOriginalFilename();  
          
        System.out.println(path+" "+filename);  
        try{  
            byte[] bytes = file.getBytes();  
            BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
                 new File(path + File.separator + filename)));  
            stream.write(bytes);  
            stream.flush();  
            stream.close();  
          
        }catch(Exception e){System.out.println(e);}  
        model.addAttribute("filePath", filename);
		return "success";
	}
	@RequestMapping(value="/register_student.htm")
	public String studentRegistration(Model model){
		model.addAttribute("studentDTO", new StudentDTO());
		return "student_register";
	}
	@RequestMapping(value="/student_list.htm",method=RequestMethod.GET)
	public String show_student(Model model){
		model.addAttribute("studentList", studentService.getStudentList());
		return "student_list";
	}
	@RequestMapping(value="/register_student.htm",method=RequestMethod.POST)
	public String postRegister(@Valid @ModelAttribute(value="studentDTO") StudentDTO std, BindingResult result){
		try{
			if(result.hasErrors()) {
				return "student_register";
			}else {
				studentService.saveStudent(std);
				return "redirect:/student_list.htm";
			}
			
		}catch(Exception e){
			return "student_register";
		}
		//return "new_student";
	}
}
