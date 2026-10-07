package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Kardex {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/universitydb";
    private static final String DB_USER = "postgres";
    private static final String DB_PASS = "admin"; 

    public static void main(String[] args) {

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Ingresa el nombre del alumno: ");
            String studentName = scanner.nextLine();

            getStudentReport(studentName);

        } catch (Exception e) {
            System.err.println("Error en la aplicación: " + e.getMessage());
        }
    }

    public static void getStudentReport(String studentName) {

        String sqlQuery = "SELECT s.id AS student_id, s.name AS student_name, d.dept_name, " +
                "c.title AS course_name, t.grade, " +
                "(t.year || '-' || CASE " +
                "    WHEN t.semester = 'Spring' THEN '1' " +
                "    WHEN t.semester = 'Summer' THEN '2' " +
                "    WHEN t.semester = 'Fall' THEN '3' " +
                "    ELSE t.semester END) AS semester " +
                "FROM student s " +
                "JOIN takes t ON s.id = t.id " +
                "JOIN course c ON t.course_id = c.course_id " +
                "JOIN department d ON s.dept_name = d.dept_name " +
                "WHERE s.name ILIKE ? ORDER BY t.year, t.semester";

        try (Connection dbConnection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement sqlStatement = dbConnection.prepareStatement(sqlQuery)) 
        {
            System.out.println("\nConexión establecida exitosamente.");

            sqlStatement.setString(1, "%" + studentName + "%");
            try (ResultSet results = sqlStatement.executeQuery()) {
                printFormattedResults(results);
            }

        } catch (SQLException e) {
            System.err.println("Error SQL: Falló la conexión o la consulta.");
            System.err.println("Detalles: " + e.getMessage());
        }
    }

    public static void printFormattedResults(ResultSet results) throws SQLException {
        boolean studentFound = false;

        while (results.next()) {
            if (!studentFound) {
                String studentId = results.getString("student_id");
                String studentName = results.getString("student_name");
                String deptName = results.getString("dept_name");

                System.out.println("\n============================================================");
                System.out.println("                    INFORMACIÓN DEL ALUMNO                  ");
                System.out.println("============================================================");
                System.out.printf("  %-15s : %s%n", "ID Estudiante", studentId);
                System.out.printf("  %-15s : %s%n", "Nombre", studentName);
                System.out.printf("  %-15s : %s%n", "Departamento", deptName);

                System.out.println("\n============================================================");
                System.out.println("                      KARDEX ACADÉMICO                      ");
                System.out.println("============================================================");
                System.out.printf(" %-35s | %-10s | %-5s%n", "ASIGNATURA", "PERÍODO", "NOTA");
                System.out.println("------------------------------------------------------------");

                studentFound = true;
            }

            String courseName = results.getString("course_name");
            String semester = results.getString("semester");
            String grade = results.getString("grade");

            if (grade == null) {
                grade = "N/A";
            }

            System.out.printf(" %-35s | %-10s | %-5s%n", courseName, semester, grade);
        }

        if (!studentFound) {
            System.out.println("\nNo se encontraron registros para el alumno especificado.");
        } else {
            System.out.println("============================================================\n");
        }
    }
}