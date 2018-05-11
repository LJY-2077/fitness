/**  
* @Title: UserService.java
* @Package com.mou.fitness.user.service
* @Description: TODO(用一句话描述该文件做什么)
* @author lijingyang   
* @date 2018年1月19日 上午9:34:43
* @version V1.0  
*/
package com.mou.fitness.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mou.fitness.common.entity.User;
import com.mou.fitness.common.mapper.UserMapper;
import com.mou.fitness.common.utils.PageUtil;
import com.mou.fitness.user.mapper.ExtUserMapper;

/**
 * @ClassName: UserService
 * @Description: TODO(用户逻辑)
 * @author li jingyang
 * @date 2018年1月19日 上午9:34:43
 *
 */
@Service
@Transactional
public class UserService
{
	@Autowired
	private ExtUserMapper userMapperExt;
	@Autowired
	private UserMapper userMapper;

	/**
	 * @Title: findAll @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         设定文件 @return List<User> 返回类型 @throws
	 */
	public List<User> findAll()
	{

		return userMapperExt.findAll();
	}

	/**
	 * @Title: findByPojo @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         user @param @return 设定文件 @return User 返回类型 @throws
	 */
	public User findByPojo(User user)
	{
		// TODO Auto-generated method stub
		return userMapperExt.findByPojo(user);
	}

	/**
	 * @Title: save @Description: TODO(这里用一句话描述这个方法的作用) @param @param user
	 *         设定文件 @return void 返回类型 @throws
	 */
	public int insert(User user)
	{
		int i = userMapper.insertSelective(user);
		return i;
	}

	/**
	 * @Title: findByPage @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         page @param @param rows @param @return 设定文件 @return List<User>
	 *         返回类型 @throws
	 */
	public List<User> findByPage(Integer page, Integer rows)
	{
		Integer min = (page - 1) * 10;
		List<User> list = userMapperExt.findByPage(min, rows);

		return list;
	}

	/**
	 * @Title: searchUser @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 * pu @param @return 设定文件 @return List<User> 返回类型 @throws
	 */
	public List<User> searchUser(PageUtil pu)

	{
		int pageSize = pu.getPageSize();
		int pageNumber = pu.getPage();
		Integer min = (pageNumber - 1) * pageSize;
		List<User> list = userMapperExt.findByPage(min, pageSize);
		return list;
	}

}
