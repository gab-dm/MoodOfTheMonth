package Controller.Employees;/*
 * JBoss, Home of Professional Open Source
 * Copyright 2015, Red Hat, Inc. and/or its affiliates, and individual
 * contributors by the @authors tag. See the copyright.txt in the
 * distribution for a full listing of individual contributors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

@WebServlet("/addUser")
public class AddUserController extends HttpServlet {

    EmployeeService employeeService = new EmployeeService();

    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            RequestDispatcher dispatcher = req.getRequestDispatcher("/add-user.jsp");
            dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // read form fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("date");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = format.parse(birthdate);
            //appel de la méthode addEmployees de la classe Service.EmployeeService
            //employeeService.addEmployees(name, email, date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }


        System.out.println("name: " + name);
        System.out.println("email: " + email);
        System.out.println("birthdate: " + birthdate);

        // get response writer
        PrintWriter writer = response.getWriter();

        // build HTML code
        String htmlResponse = "<html>";
        htmlResponse += "<h2>Your name is: " + name + "<br/>";
        htmlResponse += "Your email is: " + email + "<br/>";
        htmlResponse += "Your birthdate: " + birthdate + "<br/>";
        htmlResponse += "<button onclick=\"location.href = '/helloworld/adminPanel';\" type=\"submit\" class=\"btn btn-lg btn-primary\">Back to panel</button>";
        htmlResponse += "</h2>";
        htmlResponse += "</html>";

        // return response
        writer.println(htmlResponse);

    }

}
