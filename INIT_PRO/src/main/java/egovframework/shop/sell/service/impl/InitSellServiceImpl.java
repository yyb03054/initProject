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
package egovframework.shop.sell.service.impl;

import java.util.List;

import egovframework.shop.sell.service.InitSellService;
import egovframework.shop.sell.service.SellDefaultVO;
import egovframework.shop.sell.service.SellVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : InitSellServiceImpl.java
 * @Description : Sell Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("sellService")
public class InitSellServiceImpl extends EgovAbstractServiceImpl implements InitSellService {

	private static final Logger LOGGER = LoggerFactory.getLogger(InitSellServiceImpl.class);

	/** SellDAO */
	// TODO ibatis 사용
	@Resource(name = "sellDAO")
	private SellDAO sellDAO;
	// TODO mybatis 사용
	//  @Resource(name="sellMapper")
	//	private SellMapper sellDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SellVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	 @Override
	   public void insertProduct(SellVO vo) throws Exception {
	      

	      sellDAO.insertProduct(vo);
	      
	   }
	   
	 @Override
	   public void insertOrder(SellVO vo) throws Exception {
	      

	      sellDAO.insertOrder(vo);
	      
	   }
	   /**
	    * 이미지를 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   @Override
	   public void insertImage(SellVO vo) throws Exception {
	    

	      sellDAO.insertImage(vo);
	      
	   }
	   
	   /**
	    * 글을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   @Override
	   public void insertSell(SellVO vo) throws Exception {
	    

	      /** ID Generation Service */
	      

	      sellDAO.insertSell(vo);
	      
	   }
	   
	   @Override
	   public void insertSale(SellVO vo) throws Exception {
		   /*String id = egovIdGnrService.getNextStringId();*/
	      sellDAO.insertSale(vo);
	      
	   }
	   
	   @Override
	   public void insertShop(SellVO vo) throws Exception {
		  
	      sellDAO.insertShop(vo);
	      
	   }
	   
	   @Override
	   public void updateSale(SellVO vo) throws Exception {
	      sellDAO.updateSale(vo);
	   }
	   @Override
	   public void updateShop(SellVO vo) throws Exception {
	      sellDAO.updateShop(vo);
	   }

	   /**
	    * 글을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   @Override
	   public void updateSell(SellVO vo) throws Exception {
	      sellDAO.updateSell(vo);
	   }
	   
	   /**
	    * 글을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   @Override
	   public void updateProduct(SellVO vo) throws Exception {
	      sellDAO.updateProduct(vo);
	   }

	   @Override
	   public void updateImgY(SellVO vo) throws Exception {
	      sellDAO.updateImgY(vo);
	   }

	   @Override
	   public void updateImgN(SellVO vo) throws Exception {
	      sellDAO.updateImgN(vo);
	   }
	   
	   /**
	    * 글을 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   @Override
	   public void deleteProduct(SellVO vo) throws Exception {
	      sellDAO.deleteProduct(vo);
	   }
	   
	 
	   
	   /**
	    * 판매처를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   @Override
	   public void deleteSell(SellVO vo) throws Exception {
	      sellDAO.deleteSell(vo);
	   }
	   
	   
	   @Override
	   public void deleteShop(SellVO vo) throws Exception {
	      sellDAO.deleteShop(vo);
	   }
	   
	   /**
	    * 이미지를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   @Override
	   public void deleteImg(SellVO vo) throws Exception {
	      sellDAO.deleteImg(vo);
	   }
	   
	   @Override
	   public void deleteSale(SellVO vo) throws Exception {
	      sellDAO.deleteSale(vo);
	   }

	   /**
	    * 글을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   @Override
	   public SellVO selectProduct(SellVO vo) throws Exception {
	      SellVO resultVO = sellDAO.selectProduct(vo);
	      if (resultVO == null)
	         throw processException("info.nodata.msg");
	      return resultVO;
	   }
	   
	   @Override
	   public SellVO selectShopDetail(SellVO vo) throws Exception {
	      SellVO resultVO = sellDAO.selectShopDetail(vo);
	      if (resultVO == null)
	         throw processException("info.nodata.msg");
	      return resultVO;
	   }
	   
	   /**
	    * 글을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   @Override
	   public SellVO selectSell(SellVO vo) throws Exception {
	      SellVO resultVO = sellDAO.selectSell(vo);
	      if (resultVO == null)
	         throw processException("info.nodata.msg");
	      return resultVO;
	   }
	   
	   @Override
	   public SellVO selectOrder(SellVO vo) throws Exception {
	      SellVO resultVO = sellDAO.selectOrder(vo);
	      if (resultVO == null)
	         throw processException("info.nodata.msg");
	      return resultVO;
	   }
	   
	   @Override
	   public SellVO selectSaleNum(SellVO vo) throws Exception {
	      SellVO resultVO = sellDAO.selectSaleNum(vo);
	      if (resultVO == null)
	         throw processException("info.nodata.msg");
	      return resultVO;
	   }
	   
	   

	   /**
	    * 글 목록을 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   @Override
	   public List<?> selectProductList(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectProductList(searchVO);
	   }
	   @Override
	   public List<?> selectProductListUser(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectProductListUser(searchVO);
	   }
	   
	   @Override
	   public List<?> selectReport(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectReport(searchVO);
	   }
	   
	   /**
	    * 글 목록을 조회한다.(이미지 없는)
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   @Override
	   public List<?> selectProductListImg(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectProductListImg(searchVO);
	   }
	   
	   @Override
	   public List<?> selectShopList(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectShopList(searchVO);
	   }
	   /**
	    * 글 목록을 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   @Override
	   public List<?> selectSellList(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectSellList(searchVO);
	   }
	   
	   @Override
	   public List<?> selectOrderList(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectOrderList(searchVO);
	   }

	   /**
	    * 글 총 갯수를 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 총 갯수
	    * @exception
	    */
	   @Override
	   public int selectSellListTotCnt(SellDefaultVO searchVO) {
	      return sellDAO.selectSellListTotCnt(searchVO);
	   }
	   
	   @Override
	   public int selectShopListTotCnt(SellDefaultVO searchVO) {
	      return sellDAO.selectShopListTotCnt(searchVO);
	   }
	   
	   /**
	    * 글 총 갯수를 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 총 갯수
	    * @exception
	    */
	   @Override
	   public int selectProductListTotCnt(SellDefaultVO searchVO) {
	      return sellDAO.selectProductListTotCnt(searchVO);
	   }
	   
	   @Override
	   public int selectProductListUserTotCnt(SellDefaultVO searchVO) {
	      return sellDAO.selectProductListUserTotCnt(searchVO);
	   }
	   
	   @Override
	   public int selectOrderListTotCnt(SellDefaultVO searchVO) {
	      return sellDAO.selectOrderListTotCnt(searchVO);
	   }
	   
	   @Override
	   public List<?> selectPeriod(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectPeriod (searchVO);
	   }
	   
	   @Override
	   public List<?> selectBrand(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectBrand (searchVO);
	   }
	   
	   @Override
	   public List<?> selectDelivery(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectDelivery (searchVO);
	   }
	   
	   @Override
	   public List<?> selectShop(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectShop (searchVO);
	   }
	   
	   @Override
	   public List<?> selectImage(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectImage (searchVO);
	   }
	   
	   @Override
	   public List<?> selectSale(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectSale (searchVO);
	   }
	   
	   @Override
	   public List<?> selectSaleMax(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectSaleMax (searchVO);
	   }
	   
	   @Override
	   public List<?> selectPrdMin(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectPrdMin (searchVO);
	   }
	   
	   @Override
	   public List<?> selectMainImage(SellDefaultVO searchVO) throws Exception {
	      return sellDAO.selectMainImage (searchVO);
	   }

	}