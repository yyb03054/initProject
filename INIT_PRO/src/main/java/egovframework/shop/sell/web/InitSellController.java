/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.shop.sell.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import egovframework.shop.sell.service.InitSellService;
import egovframework.shop.sell.service.SellDefaultVO;
import egovframework.shop.sell.service.SellVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @Class Name : InitSellController.java
 * @Description : InitSell Controller Class
 * @Modification Information
 * @
 * @  ?????????      ?????????              ????????????
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           ????????????
 *
 * @author ????????????????????? ???????????? ?????????
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class InitSellController {

	/** EgovSellService */
	   @Resource(name = "sellService")
	   private InitSellService sellService;

	   /** EgovPropertyService */
	   @Resource(name = "propertiesService")
	   protected EgovPropertyService propertiesService;

	   /** Validator */
	   @Resource(name = "beanValidator")
	   protected DefaultBeanValidator beanValidator;

	   /**
	    * ??? ????????? ????????????. (pageing)
	    * @param searchVO - ????????? ????????? ?????? SellDefaultVO
	    * @param model
	    * @return "productList"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/initProductList.do")
	   public String selectProductList(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception  {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));

	      /** pageing setting */
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());

	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	      List<?> productList = sellService.selectProductList(searchVO);
	      model.addAttribute("productList", productList);
	      
	      
	      
	      List<?> productListImg = sellService.selectProductListImg(searchVO);
	      model.addAttribute("productListImg", productListImg);

	      int totCnt = sellService.selectProductListTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);
	      

	      return "sell/initProductList";
	   }
	   
	   @RequestMapping(value = "/initProductListUser.do")
	   public String selectProductListUser(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception  {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));

	      /** pageing setting */
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());

	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	      List<?> productList = sellService.selectProductListUser(searchVO);
	      model.addAttribute("productList", productList);
	      
	      
	      
	      List<?> productListImg = sellService.selectProductListImg(searchVO);
	      model.addAttribute("productListImg", productListImg);

	      int totCnt = sellService.selectProductListUserTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);
	      

	      return "sell/initProductListUser";
	   }
	   /**
	    * ????????? ????????? ????????????. (pageing)
	    * @param searchVO - ????????? ????????? ?????? SellDefaultVO
	    * @param model
	    * @return "productList"
	    * @exception Exception
	    */
	   
	   
	   @RequestMapping(value = "/initSellList.do")
	   public String selectSellList(@RequestParam("selectedId") String prdNum, @ModelAttribute("searchVO") SellVO searchVO, ModelMap model) throws Exception {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));
	      
	      /** pageing setting */
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());
	      
	      
	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	      
	      searchVO.setPrdNum(prdNum);
	      model.addAttribute(prdNum);
	      
	      List<?> sellList = sellService.selectSellList(searchVO);
	      model.addAttribute("resultList", sellList);
	      
	      int totCnt = sellService.selectSellListTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);

	      /*System.out.println(model);*/

	      return "sell/initSellList";
	   }
	   @RequestMapping(value = "/initSellListUser.do")
	   public String selectSellListUser(@RequestParam("selectedId") String prdNum, @ModelAttribute("searchVO") SellVO searchVO, ModelMap model) throws Exception {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));
	      
	      /** pageing setting */
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());
	      
	      
	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	      
	      searchVO.setPrdNum(prdNum);
	      model.addAttribute(prdNum);
	      
	      List<?> sellList = sellService.selectSellList(searchVO);
	      model.addAttribute("resultList", sellList);
	      
	      List<?> imgList = sellService.selectImage(searchVO);
	      model.addAttribute("imgList", imgList);
	      
	      int totCnt = sellService.selectSellListTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);

	      /*System.out.println(model);*/

	      return "sell/initSellListUser";
	   }

	   
	   @RequestMapping(value = "/initShopList.do")
	   public String selectShopList(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception  {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));

	      //** pageing setting *//*
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());

	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	      
	      List<?> shopList = sellService.selectShopList(searchVO);
	      model.addAttribute("shopList", shopList);

	      int totCnt = sellService.selectShopListTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);
	      

	      return "sell/initShopList";
	   }
	   
	   @RequestMapping(value = "/initOrderList.do")
	   public String selectOrderList(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception  {

	      /** EgovPropertyService.sell */
	      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	      searchVO.setPageSize(propertiesService.getInt("pageSize"));

	      //** pageing setting *//*
	      PaginationInfo paginationInfo = new PaginationInfo();
	      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	      paginationInfo.setPageSize(searchVO.getPageSize());

	      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	      
	      List<?> orderList = sellService.selectOrderList(searchVO);
	      model.addAttribute("orderList", orderList);

	      int totCnt = sellService.selectOrderListTotCnt(searchVO);
	      model.addAttribute("totCnt", totCnt);
	      paginationInfo.setTotalRecordCount(totCnt);
	      model.addAttribute("paginationInfo", paginationInfo);
	      

	      return "sell/initOrderList";
	   }

	   @RequestMapping(value = "/initReport.do")
	   public String initReport(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception  {


	      List<?> orderList = sellService.selectOrderList(searchVO);
	      model.addAttribute("orderList", orderList);

	      List<?> shopList = sellService.selectShopList(searchVO);
	      model.addAttribute("shopList", shopList);
	      
	      List<?> reportList = sellService.selectReport(searchVO);
	      model.addAttribute("reportList", reportList);

	      return "sell/initReport";
	   }
	   /**
	    * ?????? ?????? ????????? ????????????.
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param model
	    * @return "egovSellRegister"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/addProductSelect.do")
	   public String addProductView(@ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      model.addAttribute("sellVO", new SellVO());
	      
	      List<?> brand = sellService.selectBrand(sellVO);
	      model.addAttribute("brand", brand);

	      return "sell/initProductRegister";
	   }

	   /**
	    * ????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/addProduct.do" )
	   public String addProduct(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      /*// Server-Side Validation
	      beanValidator.validate(sellVO, bindingResult);

	      if (bindingResult.hasErrors()) {
	         model.addAttribute("sellVO", sellVO);
	         return "shop/productRegister";
	      }*/
		   sellVO.setPrdNum("");
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      

	      return "sell/initProductRegister";
	   }
	   
	   @RequestMapping(value = "/addProductPost.do" )
	   public String addProductPost(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      /*// Server-Side Validation
	      beanValidator.validate(sellVO, bindingResult);

	      if (bindingResult.hasErrors()) {
	         model.addAttribute("sellVO", sellVO);
	         return "shop/productRegister";
	      }*/
	      List<?> brand = sellService.selectBrand(sellVO);
	      model.addAttribute("brand", brand);
	      

	      sellService.insertProduct(sellVO);
	      status.setComplete();
	      return "forward:/initProductList.do";
	   }
	   
	   /**
	    * ????????? ?????? ????????? ????????????.
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param model
	    * @return "egovSellRegister"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/addSell.do")
	   public String addSellView(String prdNum, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      
	      SellVO sellVO = new SellVO();
	      sellVO.setPrdNum(prdNum);
	      model.addAttribute(selectProduct(sellVO, searchVO));

	      
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      
	      List<?> delList = sellService.selectDelivery(sellVO);
	      model.addAttribute("delList", delList);
	      
	      List<?> shopList = sellService.selectShop(sellVO);
	      model.addAttribute("shopList", shopList);

	      return "sell/initSellRegister";
	   }

	   /**
	    * ???????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/addSellPost.do" )
	   public String addSell(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      /*// Server-Side Validation
	      beanValidator.validate(sellVO, bindingResult);

	      if (bindingResult.hasErrors()) {
	         model.addAttribute("sellVO", sellVO);
	         return "shop/productRegister";
	      }*/

	      sellService.insertSell(sellVO);
	      status.setComplete();
	      return "forward:/initSellList.do";
	   }

	   /**
	    * ?????? ??????????????? ????????????.
	    * @param id - ????????? ??? id
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param model
	    * @return "egovSellRegister"
	    * @exception Exception
	    */
	   @RequestMapping("/updateProductView.do")
	   public String updateProductView(@RequestParam("selectedId") String prdNum, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setPrdNum(prdNum);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectProduct(sellVO, searchVO));
	      
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      
	      List<?> imgList = sellService.selectImage(sellVO);
	      model.addAttribute("imgList", imgList);

	      return "sell/initProductRegister";
	   
	   }
	   
	   @RequestMapping("/updateShopView.do")
	   public String updateShopView(@RequestParam("selectedShopReg") String shopCode, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setShopCode(shopCode);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectShopDetail(sellVO, searchVO));
	      
	   

	      return "sell/initShopRegister";
	   
	   }
	   
	   @RequestMapping("/updateShopPost.do")
	   public String updateShop( @ModelAttribute("searchVO") SellDefaultVO searchVO, String imgNum, String mainImg, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
	      
	      sellService.updateShop(sellVO);
	      status.setComplete();
	      return "forward:/initShopList.do";
	   }
	   
	   /**
	    * ????????? ??????????????? ????????????.
	    * @param id - ????????? ??? id
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param model
	    * @return "egovSellRegister"
	    * @exception Exception
	    */
	   @RequestMapping("/updateSellViewUser.do")
	   public String updateSellViewUser(String prdNum, @RequestParam("selectedShop") String shopCode, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setShopCode(shopCode);
	      sellVO.setPrdNum(prdNum);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectSell(sellVO, searchVO));
	      
	      /*List<?> saleMax = sellService.selectSaleMax(sellVO);
	      model.addAttribute("saleMax", saleMax);*/
	      
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      
	      List<?> delList = sellService.selectDelivery(sellVO);
	      model.addAttribute("delList", delList);
	      
	      List<?> shopList = sellService.selectShop(sellVO);
	      model.addAttribute("shopList", shopList);
	      
	      List<?> saleList = sellService.selectSale(sellVO);
	      model.addAttribute("saleList", saleList);
	      
	      List<?> imgList = sellService.selectImage(sellVO);
	      model.addAttribute("imgList", imgList);
	      /*System.out.println(selectBrand());*/
	      return "sell/initSellRegisterUser";
	   
	   }
	   @RequestMapping("/updateSellViewAdmin.do")
	   public String updateSellViewAdmin(String prdNum, @RequestParam("selectedShop") String shopCode, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setShopCode(shopCode);
	      sellVO.setPrdNum(prdNum);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectSell(sellVO, searchVO));
	      
	      /*List<?> saleMax = sellService.selectSaleMax(sellVO);
	      model.addAttribute("saleMax", saleMax);*/
	      
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      
	      List<?> delList = sellService.selectDelivery(sellVO);
	      model.addAttribute("delList", delList);
	      
	      List<?> shopList = sellService.selectShop(sellVO);
	      model.addAttribute("shopList", shopList);
	      
	      List<?> saleList = sellService.selectSale(sellVO);
	      model.addAttribute("saleList", saleList);
	      
	      List<?> imgList = sellService.selectImage(sellVO);
	      model.addAttribute("imgList", imgList);
	      /*System.out.println(selectBrand());*/
	      return "sell/initSellRegisterAdmin";
	   
	   }
	   @RequestMapping("/updateSellView.do")
	   public String updateSellView(String prdNum, @RequestParam("selectedShop") String shopCode, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setShopCode(shopCode);
	      sellVO.setPrdNum(prdNum);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectSell(sellVO, searchVO));
	      
	      /*List<?> saleMax = sellService.selectSaleMax(sellVO);
	      model.addAttribute("saleMax", saleMax);*/
	      
	      List<?> brdList = sellService.selectBrand(sellVO);
	      model.addAttribute("brdList", brdList);
	      
	      List<?> delList = sellService.selectDelivery(sellVO);
	      model.addAttribute("delList", delList);
	      
	      List<?> shopList = sellService.selectShop(sellVO);
	      model.addAttribute("shopList", shopList);
	      
	      List<?> saleList = sellService.selectSale(sellVO);
	      model.addAttribute("saleList", saleList);
	      
	      List<?> imgList = sellService.selectImage(sellVO);
	      model.addAttribute("imgList", imgList);
	      /*System.out.println(selectBrand());*/
	      return "sell/initSellRegister";
	   
	   }
	   
	   @RequestMapping("/selectOrder.do")
	   public String selectOrder(@RequestParam("selectedOrder") String orderNum, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model) throws Exception {
	      SellVO sellVO = new SellVO();
	      sellVO.setOrderNum(orderNum);
	      // ???????????? CoC ??? ?????? sellVO
	      model.addAttribute(selectOrder(sellVO, searchVO));
	      
	   
	      return "sell/initOrderDetail";
	   
	   }
	   
	   
	   /**
	    * ?????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return @ModelAttribute("sellVO") - ????????? ??????
	    * @exception Exception
	    */
	   public SellVO selectProduct(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO) throws Exception {
	      return sellService.selectProduct(sellVO);
	   }
	   
	   public SellVO selectOrder(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO) throws Exception {
		      return sellService.selectOrder(sellVO);
		   }
	   
	   public SellVO selectShopDetail(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO) throws Exception {
		      return sellService.selectShopDetail(sellVO);
		   }
	   
	   /**
	    * ???????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return @ModelAttribute("sellVO") - ????????? ??????
	    * @exception Exception
	    */
	   public SellVO selectSell(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO) throws Exception {
	      return sellService.selectSell(sellVO);
	   }

	   /**
	    * ?????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping("/updateProductPost.do")
	   public String updateProduct( @ModelAttribute("searchVO") SellDefaultVO searchVO, String imgNum, String mainImg, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
	      sellVO.setMainImg(mainImg);
	      sellVO.setImgNum(imgNum);
	      sellService.updateImgN(sellVO);
	      sellService.updateImgY(sellVO);
	      sellService.updateProduct(sellVO);
	      status.setComplete();
	      return "forward:/initProductList.do";
	   }
	   
	 
	   
	
	   /**
	    * ???????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping(value = "/addImage.do" )
	   public String addImage(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      sellService.insertImage(sellVO);
	      status.setComplete();
	      return "forward:/productList.do";
	   }
	   
	   @RequestMapping(value = "/addShopView.do" )
	   public String addShopView(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      
	      return "sell/initShopRegister";
	   }
	   @RequestMapping(value = "/addShop.do" )
	   public String addShop(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      sellService.insertShop(sellVO);
	      status.setComplete();
	      return "forward:/initShopList.do";
	   }
	   
	   @RequestMapping(value = "/addOrder.do" )
	   public String addOrder(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      sellService.insertOrder(sellVO);
	      status.setComplete();
	      return "sell/initOrderDetailUser";
	   }
	   
	   
	   /*?????? ??????????????? ????????????.*/
	   
	   @RequestMapping(value = "/saleRegister.do" )
	   public String saleRegister(@RequestParam("selectedSale") String saleNum, SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
		   System.out.println("saleNum : " +saleNum);
		      sellVO.setSaleNum(saleNum);
		      model.addAttribute(selectSaleNum(sellVO, searchVO));
		      
		      List<?> saleList = sellService.selectSale(sellVO);
		      
		      model.addAttribute("saleList", saleList);
		      
	      return "sell/saleRegister";
	   }
	   
	   public SellVO selectSaleNum(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO) throws Exception {
		      return sellService.selectSaleNum(sellVO);
		   }
	   
	 /*?????? ??????????????? ????????????.*/
	   
	   @RequestMapping(value = "/addSale.do" )
	   public String addSale(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
		   
	      return "sell/saleRegister";
	   }
	   
	   @RequestMapping(value = "/addSalePost.do" )
	   public String addSalePost(String periodCnt,@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
		   
		  
	      sellService.insertSale(sellVO);
	      status.setComplete();
	      return "sell/finishReg";
	   }
	   
	   @RequestMapping(value = "/selectSale.do" )
	   public ModelAndView selectSale(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {
		   List<?> saleList = sellService.selectSale(sellVO);
		   ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("saleList", saleList);
		   return mav;
	   }
	  
	   /**
	    * ?????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping("/updateSell.do")
	   public String updateSell(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      /*beanValidator.validate(sellVO, bindingResult);

	      if (bindingResult.hasErrors()) {
	         model.addAttribute("sellVO", sellVO);
	         return "shop/productRegister";
	      }*/

	      sellService.updateSell(sellVO);
	      status.setComplete();
	      return "forward:/initSellList.do";
	   }
	   /**
	    * ????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping("/updateSale.do")
	   public String updateSale(@ModelAttribute("searchVO") SellDefaultVO searchVO, SellVO sellVO, BindingResult bindingResult, Model model, SessionStatus status)
	         throws Exception {

	      sellService.updateSale(sellVO);
	      status.setComplete();
	      return "forward:/updateSellView.do";
	   }

	   /**
	    * ?????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping("/deleteProduct.do")
	   public String deleteProduct(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, SessionStatus status) throws Exception {
	      sellService.deleteProduct(sellVO);
	      status.setComplete();
	      return "forward:/initProductList.do";
	   }
	   
	   @RequestMapping("/deleteShop.do")
	   public String deleteShop(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, SessionStatus status) throws Exception {
	      sellService.deleteShop(sellVO);
	      status.setComplete();
	      return "forward:/initShopList.do";
	   }
	   
	   /**
	    * ???????????? ????????????.
	    * @param sellVO - ????????? ????????? ?????? VO
	    * @param searchVO - ?????? ???????????? ????????? ?????? VO
	    * @param status
	    * @return "forward:/productList.do"
	    * @exception Exception
	    */
	   @RequestMapping("/deleteSell.do")
	   public String deleteSell(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, SessionStatus status) throws Exception {
	      sellService.deleteSell(sellVO);
	      status.setComplete();
	      return "forward:/initSellList.do";
	   }
	   @RequestMapping(value = "/imgList.do", method=RequestMethod.POST)
	   public ModelAndView imgList(@RequestParam("selectedId") String prdNum, HttpServletRequest request, SellVO sellVO) throws Exception{
		   sellVO.setPrdNum(prdNum);
	       System.out.println(prdNum);
	       
	       List<?> imgList = sellService.selectImage(sellVO);
	       ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("imgList", imgList);
	       return mav;
	   }
	   @RequestMapping(value = "/saleList.do", method=RequestMethod.POST)
	   public ModelAndView saleList( String prdNum, String shopCode, HttpServletRequest request, SellVO sellVO) throws Exception{
		   System.out.println(prdNum);
		   sellVO.setPrdNum(prdNum);
		   sellVO.setShopCode(shopCode);
		   System.out.println(prdNum);
		   System.out.println(shopCode);
		   
	       List<?> saleList = sellService.selectSale(sellVO);
	       ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("saleList", saleList);
	       return mav;
	   }
	   
	   @RequestMapping(value = "/saleListSell.do", method=RequestMethod.POST)
	   public ModelAndView saleListSell( String prdNum, String shopCode, HttpServletRequest request, SellVO sellVO) throws Exception{
		   sellVO.setPrdNum(prdNum);
		   sellVO.setShopCode(shopCode);
	       List<?> saleList = sellService.selectSale(sellVO);
	       List<?> sellList = sellService.selectSellList(sellVO);
	       ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("saleList", saleList);
		   mav.addObject("sellList", sellList);
	       return mav;
	   }
	   
	   @RequestMapping(value = "/fileUpload.do", method=RequestMethod.POST)
	   public ModelAndView upload(MultipartFile uploadfile, @RequestParam("selectedId") String prdNum, HttpServletRequest request, SellVO sellVO) throws Exception{
		   sellVO.setPrdNum(prdNum);
		   saveFile(uploadfile, prdNum, request);
	       System.out.println(prdNum);
	       
	       List<?> imgList = sellService.selectImage(sellVO);
	       ModelAndView mav = new ModelAndView("jsonView");
		   mav.addObject("imgList", imgList);
	       return mav;
	   }
	   private String saveFile(MultipartFile file, String prdNum,  HttpServletRequest request) {
	       // ?????? ?????? ??????
	      String UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");
	       UUID uuid = UUID.randomUUID();
	       String saveName = uuid + file.getOriginalFilename();
	       
	       
	       // ????????? File ????????? ??????(????????? ??????)???
	       File saveFile = new File(UPLOAD_PATH,saveName); // ????????? ?????? ??????, ????????? ?????? ??????
	       try {
	           file.transferTo(saveFile); // ????????? ????????? saveFile????????? ????????? ??????
	       } catch (IOException e) {
	           e.printStackTrace();
	           return null;
	       }
	       SellVO sellVO = new SellVO();
	       sellVO.setImgAddress(saveName);
	       sellVO.setPrdNum(prdNum);
	       try {
	      sellService.insertImage(sellVO);
	   } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	   }
	       return saveName;
	   }
	   
	   /**
	    * jq grid ?????????
	    * @param sellVO
	    * @param model
	    * @return
	    * @throws Exception
	    */
	    @RequestMapping (value="/Test.do", produces = "application/text; charset=UTF-8")
	    public @ResponseBody String Test(SellVO sellVO,
	          HttpServletRequest request,HttpServletResponse response,
	            @RequestParam int       rows,
	            @RequestParam int       page,
	            @RequestParam String   sidx,
	            @RequestParam String   sord) throws Exception {
	   
	    List<?> sellList = sellService.selectProductList(sellVO);
	    System.out.println(sellList);
	    ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> modelMap = new HashMap<String, Object>();
	    /*ModelAndView modelAndView = new ModelAndView("jsonView");
	    modelAndView.addObject("ShopList", sellList);
	    modelAndView.addObject("abc", "33");*/
	    modelMap.put("rows", sellList);
	    String value = mapper.writeValueAsString(modelMap);
	    return value;
	    }
	    
	    @RequestMapping("/deleteImage.do")
	    public ModelAndView deleteImage(@RequestParam("selectedImg") String imgNum, @RequestParam("selectedId") String prdNum, SellVO sellVO, SessionStatus status) throws Exception {
	         
	         sellVO.setImgNum(imgNum);
	         
	        sellService.deleteImg(sellVO);
	        
	         sellVO.setPrdNum(prdNum);
	         List<?> imgList = sellService.selectImage(sellVO);   
	         ModelAndView mav = new ModelAndView("jsonView");
	         mav.addObject("imgList", imgList);
	         System.out.println("sellVO" + sellVO);
	         return mav;

	      }
	    
	    @RequestMapping("/deleteSale.do")
	    public ModelAndView deleteSale(@RequestParam("selectedSale") String saleNum, @RequestParam("selectedId") String prdNum, @RequestParam("selectedShop")String shopCode, SellVO sellVO, SessionStatus status) throws Exception {
	         
	         sellVO.setSaleNum(saleNum);
	         sellVO.setPrdNum(prdNum);
	         sellVO.setShopCode(shopCode);
	         sellService.deleteSale(sellVO);
	         
	         
	         List<?> saleList = sellService.selectSale(sellVO);   
	         ModelAndView mav = new ModelAndView("jsonView");
	         mav.addObject("saleList", saleList);
	         return mav;

	      }
	    /*@RequestMapping("/deleteSale.do")
		   public String deleteSale(@RequestParam("seletedSale") String saleNum, SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, SessionStatus status) throws Exception {
	    	sellService.deleteSale(sellVO);
		      status.setComplete();
		      return "forward:/updateSellView.do";
		   }*/
	   /**
	    * ajax ?????????
	    * @param sellVO
	    * @param model
	    * @return
	    * @throws Exception
	    */
	    @RequestMapping (value="/ajaxTest.do", method = RequestMethod.POST)
	    public ModelAndView ajaxTest(
	           SellVO sellVO,
	          HttpServletRequest request, HttpServletResponse response
	            ) throws Exception {
	       
	    List<?> sellList = sellService.selectProductList(sellVO);
	          
	    ModelAndView mav = new ModelAndView("jsonView");
	    mav.addObject("rows", sellList);
	    
	    return mav;
	    }
	   
	   
	   
	    @RequestMapping(value = "/addAjax.do")
	    public String addAjax(@ModelAttribute("searchVO") SellDefaultVO searchVO, ModelMap model) throws Exception {
	       return "sell/testGrid";
	    }
	    
	    @RequestMapping(value= "/ajaxList.do")
	    public ModelAndView ajaxList(@RequestParam("selectedId") String prdNum, @RequestParam("selectedShop") String shopCode, SellVO sellVO, HttpServletRequest request , HttpServletResponse response , Model model) throws Exception{
	    	 ModelAndView mav = new ModelAndView("jsonView");
	    	 sellVO.setShopCode(shopCode);
	    	 sellVO.setPrdNum(prdNum);
	    	 List<?> brdList = sellService.selectBrand(sellVO);
	    	 mav.addObject("brdList", brdList);
		      
		      List<?> delList = sellService.selectDelivery(sellVO);
		      mav.addObject("delList", delList);
		      
		      List<?> shopList = sellService.selectShop(sellVO);
		      mav.addObject("shopList", shopList);
		      
		      List<?> saleList = sellService.selectSale(sellVO);
		      mav.addObject("saleList", saleList);
		      
		      List<?> imgList = sellService.selectImage(sellVO);
			   mav.addObject("imgList", imgList);
			   
		      return mav;
	    }
        
	    @RequestMapping(value = "/minPrice.do", method=RequestMethod.POST)
		   public ModelAndView minPrice(@RequestBody String prdNum, HttpServletRequest request, SellVO sellVO) throws Exception{
			   System.out.println(prdNum);
			   sellVO.setPrdNum(prdNum);
			   
			   System.out.println(prdNum);
			   
			   List<?> prdMin = sellService.selectPrdMin(sellVO);
		       List<?> sellList = sellService.selectSellList(sellVO);
		       ModelAndView mav = new ModelAndView("jsonView");
			   mav.addObject("sellList", sellList);
			   mav.addObject("prdMin", prdMin);
		       return mav;
		   }
	    @RequestMapping("/main.do")
		   public String main(SellVO sellVO, @ModelAttribute("searchVO") SellDefaultVO searchVO, Model model, SessionStatus status) throws Exception {
	    	List<?> productList = sellService.selectProductListUser(searchVO);
		      model.addAttribute("productList", productList);
		      List<?> mainImg = sellService.selectMainImage(sellVO);
		      model.addAttribute("mainImg", mainImg);
		      return "sell/main";
		   }
	    @RequestMapping("/loginView.do")
		   public String loginView() throws Exception {
		      return "sell/login";
		   }
	   /* @Inject
	    MemberService memberService;
	    @RequestMapping("loginCheck.do")
	    public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
	        boolean result = memberService.loginCheck(vo, session);
	        ModelAndView mav = new ModelAndView();
	        if (result == true) { // ????????? ??????
	            // main.jsp??? ??????
	            mav.setViewName("home");
	            mav.addObject("msg", "success");
	        } else {    // ????????? ??????
	            // login.jsp??? ??????
	            mav.setViewName("member/login");
	            mav.addObject("msg", "failure");
	        }
	        return mav;
	    }
	    
	    // 03. ???????????? ??????
	    @RequestMapping("logout.do")
	    public ModelAndView logout(HttpSession session){
	        memberService.logout(session);
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("member/login");
	        mav.addObject("msg", "logout");
	        return mav;
	    }*/

	}