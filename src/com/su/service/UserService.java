package com.su.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.su.dao.EntityDao;
import com.su.model.Page;
import com.su.model.User;


@Service
public class UserService {
	@Autowired
	private EntityDao entityDao;
	protected final transient Log log = LogFactory.getLog(UserService.class);

	@Transactional
	public List<Object> getAllUsers(Page page) {//普通用户
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status!='del'");//0->sys  1->common
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	
	@Transactional
	public List<Object> getAllContextUsers(Page page,String context) {//普通用户
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status!='del' and ( a.username like '%").append(context).append("%' or a.phone like '%").append(context).append("%' or a.area like '%").append(context).append("%' )");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	public Integer getAllUserSize() {//普通用户数量
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status!='del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}
	
	public List<Object> getAllUser() {//普通用户数量
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status!='del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list;
	}
	
	public List<Object> getAllAdmins(Page page) {
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status != 'del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString(),page.getCurrentPage(),page.getEveryPage());
		return list;
	}
	public Integer getAllAdminNum() {
		StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a where a.status != 'del'");
		log.info(query);
		List<Object> list = entityDao.createQuery(query.toString());
		return list.size();
	}

	public User getUserById(String id) {
		return (User) entityDao.query(User.class, Integer.valueOf(id));
	}
	public User getUserById(Integer id) {
		return (User) entityDao.query(User.class, id);
	}

	public User getUserByField(String key, String value) {
		return (User) entityDao.queryByField(User.class, key, value);
	}

	public int saveUser(User user) {// save
		// TODO Auto-generated method stub
		// val:-1,0,1,2,3
		if (null != getUserByField("username", user.getUsername())) {
			log.info("username exists");
			return 1;// 用户名存在
		}
		if (null != getUserByField("email", user.getEmail())) {
			log.info("email exists");
			return 3;// 邮箱已被使用
		}
		try {
			Timestamp timestamp = new Timestamp(new Date().getTime());//企业入住的时间点
			user.setCtime(timestamp);//创建账号的时间
			entityDao.save(user);
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
			log.info(e.getMessage());
			return -1;
		}

	}

	public int verifyUser(User user) {

		/*StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a");*/

		String queryString = "select u from " + User.class.getSimpleName()+ " u where u.username =:username and u.password =:password";
		List<Object> list = entityDao.queryByField(queryString, new String[] { "username", "password" },new String[] { user.getUsername(), user.getPassword() });
		if (list.size() > 0) {
			return 0;// 查询成功
		}
		return 2;// 登录失败,用户不存在....
	}
	//系统用户
	public int verifyAdminUser(User user) {

		/*StringBuffer query = new StringBuffer();
		query.append("select a from ").append(User.class.getSimpleName()).append(" a");*/

		String queryString = "select u from " + User.class.getSimpleName()+ " u where u.username =:username and u.password =:password";
		List<Object> list = entityDao.queryByField(queryString, new String[] { "username", "password" },new String[] { user.getUsername(), user.getPassword() });
		if (list.size() > 0) {
			return 0;// 查询成功
		}
		return 1;// 登录失败,用户不存在....
	}

	public void activeUser(User user) {//
		// TODO Auto-generated method stub
		user.setStatus("yes");// active the user....
		entityDao.update(user);

	}
	
	public void addUseMsgByName(String username) {
		String sql = "update user set msg=msg+1 where username='"+username+"'";
		entityDao.updateExecute(sql);
	}
	
	public void addUseMsg(){
		String sql = "update user set msg=msg+1";
		entityDao.updateExecute(sql);
	}
	public void delUseMsg(){
		String sql = "update user set msg=msg-1";
		entityDao.updateExecute(sql);
	}
	public boolean saveAdmin(User user){
		boolean flag = true;
		try {
			entityDao.save(user);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			flag = false;
		}
		return flag;
	}

	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		// entityDao.delete(enterprise);
		user.setStatus("del");// delete
		entityDao.update(user);
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		// entityDao.delete(enterprise);
		entityDao.update(user);
	}

}
