package net.xieee.web.service;

import java.util.List;

import net.xieee.web.bean.Cartoon;
import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;

/**
 * this is control picture
 * 
 * @author royzhang
 *
 */
public interface PictureServiceInter extends BaseServiceInter {
	/**
	 * check db has picture ，if db has picture then return false,thus return
	 * ture;
	 * 
	 * @param pictureName
	 * @return
	 */
	public boolean checkHasPicture(String pictureName);



	/**
	 * this method is save different img
	 * 
	 * @param picture
	 *            the picture object
	 * @return handler success count
	 */
	public int savePicture(Picture picture);



	/**
	 * check the have url
	 * 
	 * @param url
	 * @return
	 */
	public int checkURL(String url);



	/**
	 * save the url
	 * 
	 * @param pageUrl
	 * @return
	 */
	public int savePictureURL(String pageUrl, String pageTitle);



	/**
	 * 获取分页信息
	 * 
	 * @param startId
	 * @param pageSize
	 * @return
	 */
	public List getPageUrls(int startId, int pageSize);



	/**
	 * 抓取的时候检查是否有重复的url
	 * 
	 * @param url
	 * @return
	 */
	public int checkSpiderUrl(String url);



	/**
	 * check catoon spider img url if return ture the img have exist thus return
	 * false
	 * 
	 * @param imgUrl
	 * @return
	 */
	public boolean checkCartoonImg(String imgUrl);



	/**
	 * save a cartoon and download cartoon img
	 * 
	 * @param cartoon
	 * @return
	 */
	public int saveCartoon(Cartoon cartoon);



	/**
	 * 保存神回复的信息,并且需要判断是否存在此数据
	 * <method description>
	 *
	 * @param pPicture
	 * @return
	 */
	public int saveGadReply(Picture pPicture);
	
	/**
	 * 通过图片的名字来查询是否gad图片抓取过
	 * @param title picture的title
	 * @param detail picture的detail
	 * @return
	 */
	public int checkGadReply(String title,String detail);
	
	/**
	 * 通过tagId来进行自动分组
	 * @param tagId
	 * @return 返回id(1,2,12)
	 */
	public int groupGif(int tagId,String titleId);
}
