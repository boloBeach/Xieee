package net.xieee.web.service.impl;

import org.springframework.stereotype.Repository;

import net.xieee.spider.util.Constants;
import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.service.GadreplayServiceInter;

@Repository
public class GadreplayServiceImpl extends BaseServiceImpl implements
		GadreplayServiceInter {

	@Override
	public Pager getGadReplay(String currentPage, int rows) {
		int currentPages = StringUtil.stringToInt(currentPage) == 0 ? 1
				: StringUtil.stringToInt(currentPage);
		Pager pager = new Pager();
		pager.Pager(rows, Contants.gad_replay_pagesize, currentPages);
		String sql = "SELECT id,picture_name,local_url,title,detail,author,top_count,down_count,old_picture,modify_time FROM picture where key_word=? and is_delete=1 ";
		Object[] params = { Constants.god_reply };
		pager = findBypager(sql, pager, params);
		return pager;
	}

	@Override
	public int getGadRows() {
		String sql = "select count(id) from picture where key_word=?";
		Object[] params = { Constants.god_reply };
		return getCount(sql, params);
	}

}
