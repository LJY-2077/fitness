/**  
* @Title: LoginInterceptor.java
* @Package com.mou.fitness.common.utils
* @Description: TODO(用一句话描述该文件做什么)
* @author lijingyang   
* @date 2018年1月22日 上午10:24:05
* @version V1.0  
*/ 
package com.mou.fitness.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
* @ClassName: LoginInterceptor
* @Description: TODO(这里用一句话描述这个类的作用)
* @author li jingyang  
* @date 2018年1月22日 上午10:24:05
*
*/
public class LoginInterceptor implements HandlerInterceptor
{

	/* (非 Javadoc)
	* <p>Title: afterCompletion</p>
	* <p>Description: </p>
	* @param arg0
	* @param arg1
	* @param arg2
	* @param arg3
	* @throws Exception
	* @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	*/ 
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	/* (非 Javadoc)
	* <p>Title: postHandle</p>
	* <p>Description: </p>
	* @param arg0
	* @param arg1
	* @param arg2
	* @param arg3
	* @throws Exception
	* @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	*/ 
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception
	{
		// TODO Auto-generated method stub
		
	}

	/* (非 Javadoc)
	* <p>Title: preHandle</p>
	* <p>Description: </p>
	* @param arg0
	* @param arg1
	* @param arg2
	* @return
	* @throws Exception
	* @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	*/ 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		 //获取请求的url  
        String url=request.getRequestURI();  
        //判断url是否是公开地址(实际使用时将公开地址配置到配置文件中)  
        if(url.indexOf("login")>=0){  
            //如果要进行登录提交，放行  
            return true;  
        }  
          
        //判断session  
        HttpSession session=request.getSession();  
        //从session中取出用户份信息  
        String username=(String)session.getAttribute("admin");  
          
        if(username!=null){  
            //身份存在，放行  
            return true;  
        }  
          
        //执行这里表示用户身份需要验证，跳转到登录界面  
        request.getRequestDispatcher("/WEB-INF/page/relogin.jsp").forward(request, response);  
          
        //return false表示拦截，不向下执行  
        //return true表示放行          
        return false;  
	}

}
