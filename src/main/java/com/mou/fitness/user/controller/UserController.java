/**  
* @Title: UserController.java
* @Package com.mou.fitness.user.controller
* @Description: TODO(用一句话描述该文件做什么)
* @author lijingyang   
* @date 2018年1月19日 上午9:34:25
* @version V1.0  
*/
package com.mou.fitness.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mou.fitness.common.entity.User;
import com.mou.fitness.common.utils.PageUtil;
import com.mou.fitness.user.service.UserService;

/**
 * @ClassName: UserController
 * @Description: TODO(用户控制)
 * @author li jingyang
 * @date 2018年1月19日 上午9:34:25
 *
 */
@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired

	private UserService userService;

	@RequestMapping("/view")
	public String findAll(ModelMap modelMap)
	{
		List<User> list = userService.findAll();
		modelMap.addAttribute("list", list);
		return "/user/view";
	}

	@RequestMapping("/queryUserList")
	@ResponseBody
	public Map<String, Object> userList(PageUtil pu, User user)
	{
		Map<String, Object> result = new HashMap<String, Object>();
		pu.setQueryObj(user);// 设置查询条件
		List<User> list = userService.searchUser(pu);
		pu.setData(list);// 设置反馈结果

		result.put("rows", list);
		result.put("total", userService.findAll().size());
		return result;

		// Map<String, Object> result = new HashMap<String, Object>();
		// List<User> list = userService.findAll();
		// // List<User> lists = userService.findByPage(page,rows);
		// result.put("rows", list);
		// result.put("total", list.size());
		// return result;
	}

	@RequestMapping("/save")
	@ResponseBody
	public int saveUser(User user, MultipartFile file, HttpServletRequest request, HttpServletResponse response)
	{
		String headIcon = fileUpload(request, response, file);
		user.setHeadIcon(headIcon.replace("\\", "/"));
		int i = userService.insert(user);
		return i;
	}

	static String fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file)
	{
		String path = "/upload/user";
		String filePath = request.getSession().getServletContext().getRealPath(path);

		String fileName = file.getOriginalFilename();
		File dir = new File(filePath, fileName);
		if (!dir.exists())
		{
			dir.mkdirs();
		}
		// MultipartFile自带的解析方法
		try
		{
			file.transferTo(dir);
			return path + "\\" + fileName;
		} catch (IllegalStateException | IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

}
