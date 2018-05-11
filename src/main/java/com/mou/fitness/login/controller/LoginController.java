/**  
* @Title: LoginController.java
* @Package com.mou.fitness.login.controller
* @Description: TODO(用一句话描述该文件做什么)
* @author lijingyang   
* @date 2018年1月19日 上午10:27:25
* @version V1.0  
*/
package com.mou.fitness.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.mou.fitness.common.entity.User;
import com.mou.fitness.user.service.UserService;

/**
 * @ClassName: LoginController
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author li jingyang
 * @date 2018年1月19日 上午10:27:25
 *
 */

@Controller
public class LoginController
{

	@Autowired
	private UserService userService;

	@RequestMapping("/main")
	public String index()
	{
		return "/main";
	}

	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}

	@RequestMapping("/admin_login")
	@ResponseBody
	public JSONObject adminLogin(User user, HttpServletRequest request)
	{
		// List<User> user=userService.findAll();
		JSONObject json = new JSONObject();
		try
		{
			User u = userService.findByPojo(user);
			if (u == null)
			{
				json.put("status", "0");
				json.put("msg", "账户不存在");
			} else
			{
				if (!u.getPassword().equals(user.getPassword()))
				{
					json.put("status", "0");
					json.put("msg", "密码错误");
				} else
				{
					HttpSession session = request.getSession();
					session.setAttribute("admin", u.getName());
					json.put("status", "1");
					json.put("msg", "登录成功");
				}

			}

		} catch (Exception e)
		{
			json.put("status", "0");
			json.put("msg", "系统故障");
			e.printStackTrace();
			/* ar.setFailMsg(Const.DATA_FAIL); */
		}
		return json;
	}

	@RequestMapping("/admin_logout")
	public String adminLogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:login";
	}

}
