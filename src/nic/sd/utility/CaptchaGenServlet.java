package nic.sd.utility;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
 
public class CaptchaGenServlet extends HttpServlet {
 
         public static final String FILE_TYPE = "jpeg";
 
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
 
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Max-Age", 0);
 
            String captchaStr="";
 
        //captchaStr=Util.generateCaptchaTextMethod();
 
            captchaStr=Util.generateCaptchaTextMethod2(6);
 
            try {
 
                int width=180;      int height=40;
 
                Color bg = new Color(221,221,221);
                //Color fg = new Color(0,0,0);
                Color fg = new Color(255,5,5);
 
                Font font = new Font("Arial", Font.BOLD, 20);
                BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.OPAQUE);
                Graphics g = cpimg.createGraphics();
                g.setFont(font);
                g.setColor(bg);
                g.fillRect(0, 0, width, height);
                g.setColor(fg);
                g.drawString(captchaStr,50,25);
                
             
                
 
                HttpSession session = request.getSession(true);
                session.setAttribute("CAPTCHA", captchaStr);
 
               OutputStream outputStream = response.getOutputStream();
 
               ImageIO.write(cpimg, FILE_TYPE, outputStream);
               outputStream.close();
 
            } catch (Exception e) {
                    e.printStackTrace();
                    //System.out.println("Error : "+e); 
            }
        }
 
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
            doPost(request, response);
        }
 
 }