package my.board.dto;

public class MemberDto {
    private Long id;
    private String email;
    private String password;
    private String nickname;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}

/*
CREATE TABLE member(
  id BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL UNIQUE KEY,
  password VARCHAR(255) NOT NULL,
  nickname VARCHAR(25) NOT NULL UNIQUE KEY,
  PRIMARY KEY (id)
);
 */