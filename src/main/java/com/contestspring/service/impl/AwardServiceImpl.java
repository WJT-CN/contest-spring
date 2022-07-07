package com.contestspring.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.*;
import com.contestspring.mapper.AwardMapper;
import com.contestspring.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.contestspring.util.StringUtils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-19
 */
@Service
public class AwardServiceImpl extends ServiceImpl<AwardMapper, Award> implements AwardService {

    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    SignsService signsService;
    @Autowired
    ContestinfoService contestinfoService;
    @Override
    public List<List<String>> exportExcel(String beginTime, String endTime,Integer cid) {
        List<List<String>> dataList = new ArrayList<>();
        List<Award> awards = baseMapper.selectList(new QueryWrapper<Award>().eq("award_cid",cid).between("award_time", beginTime,endTime));
        if(awards.size() == 0){
            return null;
        }
        for (Award award : awards) {
            if(award.getAwardState()==2){
                List<String> list = new ArrayList<>();
                String awardStudent = award.getAwardStudent();
                Student leader = studentService.getOne(new QueryWrapper<Student>().eq("student_no", awardStudent));
                list.add(leader.getStudentCollege());

                Contestinfo contestInfo = contestinfoService.getOne(new QueryWrapper<Contestinfo>().eq("cid", award.getAwardCid()));
                list.add(contestInfo.getLevel());
                list.add(contestInfo.getCname());

                String awardFile = award.getAwardFile();
                //获奖作品名称
                if(awardFile != null){
                    if(!awardFile.equals("")){
                        String[] word = award.getAwardFile().split("work/");
                        String s = word[1].split("\\.")[0];
                        list.add(s);
                    }
                    else{
                        list.add("");
                    }
                }else{
                    list.add("");
                }


                Signs one = signsService.getOne(new QueryWrapper<Signs>().eq("cid", award.getAwardCid()).eq("sign_teammumber1", award.getAwardStudent()));
                String team = "";
                String studentNo1 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber1())).getStudentName();
                team = team + studentNo1;
                if (!(one.getSignTeammumber2() == null || one.getSignTeammumber2().length() == 0)){
                    String studentNo2 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber2())).getStudentName();
                    team = team + "," + studentNo2;
                }
                if (!(one.getSignTeammumber3() == null || one.getSignTeammumber3().length() == 0)){
                    String studentNo3 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber3())).getStudentName();
                    team = team + "," + studentNo3;
                }
                if (!(one.getSignTeammumber4() == null || one.getSignTeammumber4().length() == 0)){
                    String studentNo4 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber4())).getStudentName();
                    team = team + "," + studentNo4;
                }
                if (!(one.getSignTeammumber5() == null || one.getSignTeammumber5().length() == 0)){
                    String studentNo5 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber5())).getStudentName();
                    team = team + "," + studentNo5;
                }
                if (!(one.getSignTeammumber6() == null || one.getSignTeammumber6().length() == 0)){
                    String studentNo6 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber6())).getStudentName();
                    team = team + "," + studentNo6;
                }
                if (!(one.getSignTeammumber7() == null || one.getSignTeammumber7().length() == 0)){
                    String studentNo7 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber7())).getStudentName();
                    team = team + "," + studentNo7;
                }
                if (!(one.getSignTeammumber8() == null || one.getSignTeammumber8().length() == 0)){
                    String studentNo8 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber8())).getStudentName();
                    team = team + "," + studentNo8;
                }
                if (!(one.getSignTeammumber9() == null || one.getSignTeammumber9().length() == 0)){
                    String studentNo9 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber9())).getStudentName();
                    team = team + "," + studentNo9;
                }
                if (!(one.getSignTeammumber10() == null || one.getSignTeammumber10().length() == 0)) {
                    String studentNo10 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber10())).getStudentName();
                    team = team + "," + studentNo10;
                }
                list.add(team);

                list.add(one.getGuideTeacher());
                list.add(award.getAwardName());
                list.add(String.valueOf(award.getAwardTime()));


                //TODO
                //教研分
                list.add("");

                list.add(contestInfo.getLevel());
                dataList.add(list);
            }
        }
        return dataList;
    }

    @Override
    public List<List<String>> exportCollegeExcel(String college, String beginTime, String endTime,Integer cid) {
        List<List<String>> dataList = new ArrayList<>();
        List<Award> awards = baseMapper.selectList(new QueryWrapper<Award>().eq("award_cid",cid).between("award_time", beginTime,endTime));
        if(awards.size() == 0){
            return null;
        }
        for (Award award : awards) {
            if(award.getAwardState() == 2){
                List<String> list = new ArrayList<>();
                String awardStudent = award.getAwardStudent();
                Student leader = studentService.getOne(new QueryWrapper<Student>().eq("student_no", awardStudent));
                if(leader.getStudentCollege().equals(college)){
                    Contestinfo contestInfo = contestinfoService.getOne(new QueryWrapper<Contestinfo>().eq("cid", award.getAwardCid()));
                    list.add(contestInfo.getCname());

                    Signs one = signsService.getOne(new QueryWrapper<Signs>().eq("cid", award.getAwardCid()).eq("sign_teammumber1", award.getAwardStudent()));
                    Student student1 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber1()));
                    list.add(student1.getStudentName());
                    list.add(student1.getStudentClasses());
                    if (!(one.getSignTeammumber2() == null || one.getSignTeammumber2().length() == 0)){
                        Student student2 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber2()));
                        list.add(student2.getStudentName());
                        list.add(student2.getStudentClasses());
                    }else {
                        list.add("");
                        list.add("");
                    }
                    if (!(one.getSignTeammumber3() == null || one.getSignTeammumber3().length() == 0)){
                        Student student3 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber3()));
                        list.add(student3.getStudentName());
                        list.add(student3.getStudentClasses());
                    }else {
                        list.add("");
                        list.add("");
                    }
                    if (!(one.getSignTeammumber4() == null || one.getSignTeammumber4().length() == 0)){
                        Student student4 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber4()));
                        list.add(student4.getStudentName());
                        list.add(student4.getStudentClasses());
                    }else {
                        list.add("");
                        list.add("");
                    }
                    if (!(one.getSignTeammumber5() == null || one.getSignTeammumber5().length() == 0)){
                        Student student5 = studentService.getOne(new QueryWrapper<Student>().eq("student_no", one.getSignTeammumber5()));
                        list.add(student5.getStudentName());
                        list.add(student5.getStudentClasses());
                    }else {
                        list.add("");
                        list.add("");
                    }
                    list.add(college);
                    list.add(one.getGuideTeacher());
                    list.add(award.getAwardName());
                    list.add(contestInfo.getOrganizer());
                    list.add(String.valueOf(one.getSignTime()));
                }
                dataList.add(list);
            }
        }
        return dataList;
    }

    @Override
    public List<List<String>> exportMoney(String beginTime, String endTime,Integer cid) {
        List<List<String>> dataList = new ArrayList<>();
        List<Award> awards = baseMapper.selectList(new QueryWrapper<Award>().eq("award_cid",cid).between("award_time", beginTime,endTime));
        if(awards.size() == 0){
            return null;
        }
        for (Award award : awards) {
            if(award.getAwardState() == 2){
                List<String> list = new ArrayList<>();
                String awardStudent = award.getAwardStudent();
                Student leader = studentService.getOne(new QueryWrapper<Student>().eq("student_no", awardStudent));
                list.add(leader.getStudentNo());
                list.add(leader.getStudentName());

                list.add(leader.getStudentCard());
                list.add("");
                list.add(leader.getStudentBank());

                list.add(leader.getStudentPhone());

                dataList.add(list);
            }

        }
        return dataList;
    }
}
