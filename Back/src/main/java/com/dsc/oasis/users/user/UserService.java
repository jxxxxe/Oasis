package com.dsc.oasis.users.user;

import com.dsc.oasis.users.utils.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final Encrypt encrypt;

    @Autowired
    public UserService(UserRepository userRepository, Encrypt encrypt){
        this.userRepository = userRepository;
        this.encrypt = encrypt;
    }

    @Transactional
    public String register(OasisUser user) {
        String email = user.getEmail();
        String password = encrypt.hashPassword(user.getPassword());

        if(email.equals("") || password.equals("")){
            return "failed";
        }

        OasisUser realUser = new OasisUser();
        realUser.setEmail(email);
        realUser.setPassword(password);

        if(userRepository.findUserByEmail(email).isPresent()){
            throw new IllegalStateException("이미 유저가 존재합니다.");
        }

        userRepository.save(realUser);
        return "success";
    }

    @Transactional
    public String login(OasisUser user) throws Exception {
        OasisUser tmpUser = userRepository.findUserByEmail(user.getEmail())
                .orElseThrow(()->new IllegalStateException(
                        "user id" + user.getId()+"는 없습니다."
                ));

        boolean checkPassword = encrypt.comparePassword(user.getPassword(), tmpUser.getPassword());
        if(!checkPassword){
            return "failed";
        }

        String token = encrypt.makeJwt(user.getId());
        tmpUser.setToken(token);
        userRepository.save(tmpUser);

        return "success";
    }

    @Transactional
    public String logout(OasisUser user) throws Exception{
        OasisUser tmpUser = userRepository.findUserByEmail(user.getEmail())
                .orElseThrow(()->new IllegalStateException(
                        "user id" + user.getId()+"는 없습니다."
                ));

        tmpUser.setToken("");
        userRepository.save(tmpUser);

        return "success";
    }
}
