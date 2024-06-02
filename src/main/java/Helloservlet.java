package com.example.oop_lr8;



import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URISyntaxException;
import java.util.Random;

@WebServlet("/Users_table")
public class HelloServlet extends HttpServlet {

    @Override
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Users.jsp");
        requestDispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        Random rand = new Random();
        String randValue = Integer.toString(rand.nextInt(1000));

        JSONObject json = new JSONObject();
        json.put("id", randValue);
        json.put("user_firstname", req.getParameter("user_firstname"));
        json.put("user_lastname", req.getParameter("user_lastname"));
        json.put("group", req.getParameter("group"));
        json.put("age", req.getParameter("age"));
        json.put("subject", req.getParameter("subject"));


        //System.out.println(json);

        String path = "Users.json";

        ServletContext context = getServletContext();

        InputStream inputStream = context.getResourceAsStream(path);

        if (inputStream != null) {
            System.out.println("?");

            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            StringBuilder jsonString = new StringBuilder();

            while (true) {
                String text = bufferedReader.readLine();
                if (text == null)
                    break;
                jsonString.append(text);
            }

            System.out.println(jsonString);

            JSONArray array = new JSONArray(jsonString.toString());

            array.put(json);

            System.out.println(array);

            String fullPath;
            try {
                fullPath = new File(HelloServlet.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getParentFile().getParentFile().getParentFile().getParent();
                fullPath += File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "Users.json";
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }

            try(FileWriter writer = new FileWriter(fullPath)){
                writer.write(array.toString(4));
                writer.flush();
                writer.close();
            } catch (IOException ex){
                System.out.println("full Error!!!");
                ex.printStackTrace();
            }

            doGet(req, resp);
        }

    }
}
