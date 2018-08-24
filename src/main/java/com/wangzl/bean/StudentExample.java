package com.wangzl.bean;

import java.util.ArrayList;
import java.util.List;

public class StudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andStudentIdIsNull() {
            addCriterion("student_id is null");
            return (Criteria) this;
        }

        public Criteria andStudentIdIsNotNull() {
            addCriterion("student_id is not null");
            return (Criteria) this;
        }

        public Criteria andStudentIdEqualTo(Integer value) {
            addCriterion("student_id =", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotEqualTo(Integer value) {
            addCriterion("student_id <>", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThan(Integer value) {
            addCriterion("student_id >", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("student_id >=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThan(Integer value) {
            addCriterion("student_id <", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThanOrEqualTo(Integer value) {
            addCriterion("student_id <=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdIn(List<Integer> values) {
            addCriterion("student_id in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotIn(List<Integer> values) {
            addCriterion("student_id not in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdBetween(Integer value1, Integer value2) {
            addCriterion("student_id between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("student_id not between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNull() {
            addCriterion("student_name is null");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNotNull() {
            addCriterion("student_name is not null");
            return (Criteria) this;
        }

        public Criteria andStudentNameEqualTo(String value) {
            addCriterion("student_name =", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotEqualTo(String value) {
            addCriterion("student_name <>", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThan(String value) {
            addCriterion("student_name >", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThanOrEqualTo(String value) {
            addCriterion("student_name >=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThan(String value) {
            addCriterion("student_name <", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThanOrEqualTo(String value) {
            addCriterion("student_name <=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLike(String value) {
            addCriterion("student_name like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotLike(String value) {
            addCriterion("student_name not like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameIn(List<String> values) {
            addCriterion("student_name in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotIn(List<String> values) {
            addCriterion("student_name not in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameBetween(String value1, String value2) {
            addCriterion("student_name between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotBetween(String value1, String value2) {
            addCriterion("student_name not between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentGenderIsNull() {
            addCriterion("student_gender is null");
            return (Criteria) this;
        }

        public Criteria andStudentGenderIsNotNull() {
            addCriterion("student_gender is not null");
            return (Criteria) this;
        }

        public Criteria andStudentGenderEqualTo(String value) {
            addCriterion("student_gender =", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderNotEqualTo(String value) {
            addCriterion("student_gender <>", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderGreaterThan(String value) {
            addCriterion("student_gender >", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderGreaterThanOrEqualTo(String value) {
            addCriterion("student_gender >=", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderLessThan(String value) {
            addCriterion("student_gender <", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderLessThanOrEqualTo(String value) {
            addCriterion("student_gender <=", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderLike(String value) {
            addCriterion("student_gender like", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderNotLike(String value) {
            addCriterion("student_gender not like", value, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderIn(List<String> values) {
            addCriterion("student_gender in", values, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderNotIn(List<String> values) {
            addCriterion("student_gender not in", values, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderBetween(String value1, String value2) {
            addCriterion("student_gender between", value1, value2, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentGenderNotBetween(String value1, String value2) {
            addCriterion("student_gender not between", value1, value2, "studentGender");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIsNull() {
            addCriterion("student_password is null");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIsNotNull() {
            addCriterion("student_password is not null");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordEqualTo(String value) {
            addCriterion("student_password =", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotEqualTo(String value) {
            addCriterion("student_password <>", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordGreaterThan(String value) {
            addCriterion("student_password >", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("student_password >=", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLessThan(String value) {
            addCriterion("student_password <", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLessThanOrEqualTo(String value) {
            addCriterion("student_password <=", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordLike(String value) {
            addCriterion("student_password like", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotLike(String value) {
            addCriterion("student_password not like", value, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordIn(List<String> values) {
            addCriterion("student_password in", values, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotIn(List<String> values) {
            addCriterion("student_password not in", values, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordBetween(String value1, String value2) {
            addCriterion("student_password between", value1, value2, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentPasswordNotBetween(String value1, String value2) {
            addCriterion("student_password not between", value1, value2, "studentPassword");
            return (Criteria) this;
        }

        public Criteria andStudentNationalIsNull() {
            addCriterion("student_national is null");
            return (Criteria) this;
        }

        public Criteria andStudentNationalIsNotNull() {
            addCriterion("student_national is not null");
            return (Criteria) this;
        }

        public Criteria andStudentNationalEqualTo(String value) {
            addCriterion("student_national =", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalNotEqualTo(String value) {
            addCriterion("student_national <>", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalGreaterThan(String value) {
            addCriterion("student_national >", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalGreaterThanOrEqualTo(String value) {
            addCriterion("student_national >=", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalLessThan(String value) {
            addCriterion("student_national <", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalLessThanOrEqualTo(String value) {
            addCriterion("student_national <=", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalLike(String value) {
            addCriterion("student_national like", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalNotLike(String value) {
            addCriterion("student_national not like", value, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalIn(List<String> values) {
            addCriterion("student_national in", values, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalNotIn(List<String> values) {
            addCriterion("student_national not in", values, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalBetween(String value1, String value2) {
            addCriterion("student_national between", value1, value2, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentNationalNotBetween(String value1, String value2) {
            addCriterion("student_national not between", value1, value2, "studentNational");
            return (Criteria) this;
        }

        public Criteria andStudentAddressIsNull() {
            addCriterion("student_address is null");
            return (Criteria) this;
        }

        public Criteria andStudentAddressIsNotNull() {
            addCriterion("student_address is not null");
            return (Criteria) this;
        }

        public Criteria andStudentAddressEqualTo(String value) {
            addCriterion("student_address =", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressNotEqualTo(String value) {
            addCriterion("student_address <>", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressGreaterThan(String value) {
            addCriterion("student_address >", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressGreaterThanOrEqualTo(String value) {
            addCriterion("student_address >=", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressLessThan(String value) {
            addCriterion("student_address <", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressLessThanOrEqualTo(String value) {
            addCriterion("student_address <=", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressLike(String value) {
            addCriterion("student_address like", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressNotLike(String value) {
            addCriterion("student_address not like", value, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressIn(List<String> values) {
            addCriterion("student_address in", values, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressNotIn(List<String> values) {
            addCriterion("student_address not in", values, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressBetween(String value1, String value2) {
            addCriterion("student_address between", value1, value2, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentAddressNotBetween(String value1, String value2) {
            addCriterion("student_address not between", value1, value2, "studentAddress");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeIsNull() {
            addCriterion("student_enrollment_time is null");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeIsNotNull() {
            addCriterion("student_enrollment_time is not null");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeEqualTo(String value) {
            addCriterion("student_enrollment_time =", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeNotEqualTo(String value) {
            addCriterion("student_enrollment_time <>", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeGreaterThan(String value) {
            addCriterion("student_enrollment_time >", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeGreaterThanOrEqualTo(String value) {
            addCriterion("student_enrollment_time >=", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeLessThan(String value) {
            addCriterion("student_enrollment_time <", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeLessThanOrEqualTo(String value) {
            addCriterion("student_enrollment_time <=", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeLike(String value) {
            addCriterion("student_enrollment_time like", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeNotLike(String value) {
            addCriterion("student_enrollment_time not like", value, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeIn(List<String> values) {
            addCriterion("student_enrollment_time in", values, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeNotIn(List<String> values) {
            addCriterion("student_enrollment_time not in", values, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeBetween(String value1, String value2) {
            addCriterion("student_enrollment_time between", value1, value2, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentEnrollmentTimeNotBetween(String value1, String value2) {
            addCriterion("student_enrollment_time not between", value1, value2, "studentEnrollmentTime");
            return (Criteria) this;
        }

        public Criteria andStudentOtherIsNull() {
            addCriterion("student_other is null");
            return (Criteria) this;
        }

        public Criteria andStudentOtherIsNotNull() {
            addCriterion("student_other is not null");
            return (Criteria) this;
        }

        public Criteria andStudentOtherEqualTo(String value) {
            addCriterion("student_other =", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherNotEqualTo(String value) {
            addCriterion("student_other <>", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherGreaterThan(String value) {
            addCriterion("student_other >", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherGreaterThanOrEqualTo(String value) {
            addCriterion("student_other >=", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherLessThan(String value) {
            addCriterion("student_other <", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherLessThanOrEqualTo(String value) {
            addCriterion("student_other <=", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherLike(String value) {
            addCriterion("student_other like", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherNotLike(String value) {
            addCriterion("student_other not like", value, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherIn(List<String> values) {
            addCriterion("student_other in", values, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherNotIn(List<String> values) {
            addCriterion("student_other not in", values, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherBetween(String value1, String value2) {
            addCriterion("student_other between", value1, value2, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentOtherNotBetween(String value1, String value2) {
            addCriterion("student_other not between", value1, value2, "studentOther");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdIsNull() {
            addCriterion("student_class_id is null");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdIsNotNull() {
            addCriterion("student_class_id is not null");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdEqualTo(Integer value) {
            addCriterion("student_class_id =", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdNotEqualTo(Integer value) {
            addCriterion("student_class_id <>", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdGreaterThan(Integer value) {
            addCriterion("student_class_id >", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("student_class_id >=", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdLessThan(Integer value) {
            addCriterion("student_class_id <", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("student_class_id <=", value, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdIn(List<Integer> values) {
            addCriterion("student_class_id in", values, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdNotIn(List<Integer> values) {
            addCriterion("student_class_id not in", values, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdBetween(Integer value1, Integer value2) {
            addCriterion("student_class_id between", value1, value2, "studentClassId");
            return (Criteria) this;
        }

        public Criteria andStudentClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("student_class_id not between", value1, value2, "studentClassId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}