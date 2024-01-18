<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBUtil" %>

<html>
<head>
    <title>Request Details</title>
      <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<%
    String loggedInUser = (String) session.getAttribute("username");
    String firstName = (String) session.getAttribute("firstname");
    String combinedName = (firstName != null && !firstName.isEmpty()) ? firstName : loggedInUser;
%>
    <h2>Request Details for <% if (firstName != null && !firstName.isEmpty()) { %>
           <%= firstName %>!
        <% } else { %>
           <%= loggedInUser %>!
        <% } %></h2>

    <table>
        <thead>
            <tr>
                
                <th>Floor No</th>
                <th>Door No</th>
                <th>Username</th>
                <th>Contact</th>
                <th>Comment</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                   
                    conn = DBUtil.getConnection();

                  
                    
                    String sql = "SELECT * FROM allrequest WHERE username=?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, combinedName);
                    rs = pstmt.executeQuery();

                   
                    while (rs.next()) {
            %>
                        <tr>
                            <%-- <td><%= rs.getInt("id") %></td>--%>
                            <td><%= rs.getInt("floor_no") %></td>
                            <td><%= rs.getInt("door_no") %></td>
                            <td><%= rs.getString("username") %></td>
                            <td><%= rs.getString("contact") %></td>
                            <td><%= rs.getString("comment") %></td>
                           <td><%= (rs.getString("status") != null) ? rs.getString("status") : "Requested" %></td>

                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } 
            %>
        </tbody>
    </table>
</body>
</html>
