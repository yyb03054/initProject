package com.init.resume.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.init.resume.main.service.PdfService;
import com.init.resume.main.service.QualificationService;
import com.init.resume.main.vo.AreaVO;
import com.init.resume.main.vo.ClientVO;
import com.init.resume.main.vo.FileAttachVO;
import com.init.resume.main.vo.InstituteVO;
import com.init.resume.main.vo.OccupationVO;
import com.init.resume.main.vo.QualificationCodeVO;
import com.init.resume.main.vo.QualificationVO;
import com.init.resume.main.vo.SpotVO;
import com.init.resume.main.vo.TaskVO;
import com.init.resume.main.vo.UserInfoVO;
import com.init.resume.main.vo.WorkVO;



@Controller
public class PdfController {
	private PdfService pdfService = null;
	@Resource(name = "PdfService")
    public void setPdfService(PdfService pdfService) {
    this.pdfService = pdfService;
    }
	@RequestMapping("{id}/pdfSave.do")
	   public String updateSale(@PathVariable("id") String Id, Model model, QualificationVO qualificationVO) throws Exception{
		List<UserInfoVO> value = pdfService.getDetail(Id);
        List<FileAttachVO> fileAttachs = pdfService.fileDetail(Id);
        List<TaskVO> task = pdfService.taskSelect();
        List<ClientVO> client = pdfService.clientSelect();
        List<InstituteVO> institute = pdfService.instituteSelect();
        List<SpotVO> spot = pdfService.spotSelect();
        List<QualificationCodeVO> qualification_codes = pdfService.qualification_codeSelect();
        List<OccupationVO> occupation = pdfService.occupationSelect();
        List<AreaVO> area = pdfService.areaSelect();
/*        int Id1 = Integer.valueOf(Id);
        List<QualificationVO> qual = pdfService.qualifiSelect(Id);*/
	      
        
        
        String[] areaArray = value.get(0).getArea().split(",");
        
        for(int i =0; i<areaArray.length; i ++) {
        	System.out.println(areaArray[i]);
        }
        
        QualificationVO qualVO = new QualificationVO();
        UserInfoVO personal_info = new UserInfoVO();
        personal_info.setId(Id);
        personal_info.setInfo_id(Id);
        qualVO.setInfo_id(Id);
        personal_info.setName(value.get(0).getName());
        personal_info.setBirth(value.get(0).getBirth());
        personal_info.setPhone(value.get(0).getPhone());
        personal_info.setEmail(value.get(0).getEmail());
        personal_info.setCareer_age(value.get(0).getCareer_age());
        personal_info.setQualifi(value.get(0).getQualifi());
        personal_info.setOccupation(value.get(0).getOccupation());
        personal_info.setTask(value.get(0).getTask());
        personal_info.setAddress(value.get(0).getAddress());
        personal_info.setDetailaddress(value.get(0).getDetailaddress());
        
    

        model.addAttribute("detailset", personal_info);
        model.addAttribute("detailArea", areaArray);
        model.addAttribute("area", area);
        model.addAttribute("file", fileAttachs);
        model.addAttribute("task", task);
        model.addAttribute("occupation", occupation);
        model.addAttribute("client", client);
        model.addAttribute("institute", institute);
        model.addAttribute("spot", spot);
        model.addAttribute("qualifi", qualification_codes);
        /*model.addAttribute("qual", qual);*/
        
	  
	      return "resume/resume_pdf";
	   }
	
	@RequestMapping("/selectPdf")
	   public ModelAndView saleListSell(String info_id, HttpServletRequest request, QualificationVO qualificationVO) throws Exception{
		
		/*qualificationVO.setId(id);*/
		UserInfoVO personal_info = new UserInfoVO();
		personal_info.setMember_id(info_id);
		qualificationVO.setInfoId(info_id);
		System.out.println("아이디"+info_id);
		System.out.println("브이오"+qualificationVO);
	       List<QualificationVO> qual = pdfService.qualifiSelect(info_id);
	       ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("qual", qual);
	       return mav;
	   }
}