package com.mou.fitness.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mou.fitness.common.entity.User;
import com.mou.fitness.common.utils.PageUtil;

public interface ExtUserMapper
{

	/**
	 * @Title: findAll @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         设定文件 @return List<User> 返回类型 @throws
	 */
	List<User> findAll();

	/**
	 * @param user
	 * 			@Title: findByPojo @Description:
	 *            TODO(这里用一句话描述这个方法的作用) @param @return 设定文件 @return User
	 *            返回类型 @throws
	 */
	User findByPojo(User user);

	/**
	 * @Title: save @Description: TODO(这里用一句话描述这个方法的作用) @param @param user
	 *         设定文件 @return void 返回类型 @throws
	 */
	void insert(User user);

	/**
	 * @Title: findByPage @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         min @param @param max @param @return 设定文件 @return List<User>
	 *         返回类型 @throws
	 */
	List<User> findByPage(@Param("minSize") Integer minSize, @Param("maxSize") Integer maxSize);

	/**
	* @Title: searchUser
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param @param pu
	* @param @return    设定文件
	* @return List<User>    返回类型
	* @throws
	*/ 
	List<User> searchUser(PageUtil pu);
}