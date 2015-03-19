package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.stereotype.Repository;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Cartoon;
import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;
import net.xieee.web.service.PictureServiceInter;

@Repository
public class PictureServiceImpl extends BaseServiceImpl implements
		PictureServiceInter {

	public boolean checkHasPicture(String pictureName) {
		String sql = "select count(1) from picture where picture_name=?";
		Object[] params = { pictureName };
		int result = getCount(sql, params);
		if (result != 0) {
			return true;
		}
		return false;
	}

	public int savePicture(Picture picture) {
		if (!StringUtil.isNull(picture)) {
			String sql = "insert into picture(picture_name,local_url,title,type,spark_url,author,parent_picture,key_word,width,height,inter_url,detail) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { picture.getPicture_name(),
					picture.getLocal_url(), picture.getTitle(),
					picture.getType(), picture.getSpark_url(),
					picture.getAuthor(), picture.getParent_picture(),
					picture.getKey_word(), picture.getWidth(),
					picture.getHeight(), picture.getInter_url(),
					picture.getDetail() };
			return save(sql, params);
		}
		return 0;
	}

	public int checkURL(String url) {
		if (!StringUtil.isNull(url)) {
			String sql = "select count(1) from pageurl where url=? and is_delete=?";
			Object[] params = { url, 0 };
			return getCount(sql, params);
		}

		return 0;
	}

	public int savePictureURL(String pageUrl, String pageTitle) {
		if (!StringUtil.isNull(pageUrl)) {
			String saveSql = "insert into pageurl(url,title) values(?,?)";
			Object[] params = { pageUrl, pageTitle };
			return save(saveSql, params);
		}
		return 0;
	}

	public List getPageUrls(int startId, int pageSize) {
		String sql = "select id,url from pageurl where id>? limit 0,"
				+ pageSize;
		return findList(sql, new Object[] { startId });
	}

	public int updateIsDelete(int pageUrlId) {
		String sql = "update pageurl set is_delete=? where id=?";
		return update(sql, new Object[] { 1, pageUrlId });
	}

	public int checkSpiderUrl(String url) {
		if (!StringUtil.isNull(url)) {
			String sql = "select count(1) from pageurl where url=?";
			Object[] params = { url };
			return getCount(sql, params);
		}
		return 0;
	}

	public boolean checkCartoonImg(String imgUrl) {
		if (!StringUtil.isNull(imgUrl)) {
			String sql = "select count(1) from cartoon where cartoon_inter_url =?";
			Object[] params = { imgUrl };
			int tmp = getCount(sql, params);
			if (tmp > 0) {
				return true;
			}
		}
		return false;

	}

	public int saveCartoon(Cartoon cartoon) {
		String sql = "insert into cartoon(cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,cartoon_image_name,cartoon_inter_url,image_height,image_width,cartoon_local_url,cartoon_parent_url) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params ={cartoon.getCartoon_name(),cartoon.getCartoon_title(),cartoon.getCartoon_user_name(),cartoon.getCartoon_detail(),cartoon.getCartoon_image_name(),cartoon.getCartoon_inter_url(),cartoon.getImage_height(),cartoon.getImage_width(),cartoon.getCartoon_local_url(),cartoon.getCartoon_parent_url()};
		return save(sql, params);
	}

	@Override
	public int saveGadReply(Picture pPicture) {
		String checkSql = "select count(1) from picture where title =? and detail=? ";
		Object[] params = {pPicture.getTitle(),pPicture.getDetail()};
		int checkNumber = checkGadReply(pPicture.getTitle(),pPicture.getDetail());
		if(checkNumber==0){
			checkSql  = "insert into picture(title,detail) values(?,?)";
			return save(checkSql, params);
		}
		return 0;
	}

	@Override
	public int checkGadReply(String title,String detail) {
		String checkSql = "select count(1) from picture where title =? and detail=? ";
		Object[] params = {title,detail};
		return getCount(checkSql, params);
	}

	@Override
	public int groupGif(int tagId,int titleId) {
		String sql = "select id,local_url,title from picture where is_delete=1 and key_word=? and parent_picture is null limit "+StringUtil.random()+"";
		Object[] params = {tagId};
		List list = getList(sql, params);
		Map map = null;
		String insertParent = "insert into parent_picture(parent_picture_name,detail,picture_url,catalog_id) values(?,?,?,?)";
		if(!list.isEmpty()){
			map = (Map)list.get(0);
			Object[] param = {"搞笑gif第"+titleId+"期",(String)map.get("title"),(String)map.get("local_url"),tagId};
			int parentId  = save(insertParent, param);
			// 保存好了，那么就修改picture表里面的catalog_id
			if(!StringUtil.isNull(parentId)){
				String ids = "";
				for (int i = 0; i < list.size(); i++) {
					map = (Map) list.get(i);
					ids+=map.get("id")+",";
				}
				Object[] pObjects = {parentId};
				String update = "update picture set parent_picture=? where id in ("+ids.substring(0,ids.lastIndexOf(","))+")";
				return update(update, pObjects);
			}
		}
		return 0;
	}

}
