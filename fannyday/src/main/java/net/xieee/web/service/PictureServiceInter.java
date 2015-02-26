package net.xieee.web.service;

import java.util.List;

import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;

/**
 * this is control picture 
 * @author royzhang
 *
 */
public interface PictureServiceInter extends BaseServiceInter{
	/**
	 * check db has picture ，if db has picture then return false,thus return ture;
	 * @param pictureName
	 * @return
	 */
	public boolean checkHasPicture(String pictureName);
	
	/**
	 * this method is save different img
	 * @param picture the picture object
	 * @return handler success count
	 */
	public int savePicture(Picture picture);
	
	/**
	 * check the have url
	 * @param url
	 * @return
	 */
	public int checkURL(String url);
	
	/**
	 * save the url
	 * @param pageUrl
	 * @return
	 */
	public int savePictureURL(String pageUrl,String pageTitle);
	
	/**
	 * 获取分页信息
	 * 
	 * @param startId
	 * @param pageSize
	 * @return
	 */
	public List getPageUrls(int startId,int pageSize);
	
	/**
	 * 抓取的时候检查是否有重复的url
	 * @param url
	 * @return
	 */
	public int checkSpiderUrl(String url);
}
