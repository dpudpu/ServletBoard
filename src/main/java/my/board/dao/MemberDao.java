package my.board.dao;

import my.board.dto.MemberDto;

import java.sql.*;

public class MemberDao {
    public int signUp(MemberDto memberDto) {
        Connection conn;
        PreparedStatement ps = null;
        conn = DbUtil.connect();

        int result = 0;
        try {

            String sql = "INSERT INTO member (nickname, password, email)" +
                    "VALUES(?,?,?);";
            ps = conn.prepareStatement(sql);
            ps.setString(1, memberDto.getNickname());
            ps.setString(2, memberDto.getPassword());
            ps.setString(3, memberDto.getEmail());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DbUtil.close(conn, ps);
        }
        return result;
    }
}
