package com.wangzl.bean;

import java.util.ArrayList;
import java.util.List;

public class TeachExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TeachExample() {
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

        public Criteria andTeachIdIsNull() {
            addCriterion("teach_id is null");
            return (Criteria) this;
        }

        public Criteria andTeachIdIsNotNull() {
            addCriterion("teach_id is not null");
            return (Criteria) this;
        }

        public Criteria andTeachIdEqualTo(Integer value) {
            addCriterion("teach_id =", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdNotEqualTo(Integer value) {
            addCriterion("teach_id <>", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdGreaterThan(Integer value) {
            addCriterion("teach_id >", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("teach_id >=", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdLessThan(Integer value) {
            addCriterion("teach_id <", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdLessThanOrEqualTo(Integer value) {
            addCriterion("teach_id <=", value, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdIn(List<Integer> values) {
            addCriterion("teach_id in", values, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdNotIn(List<Integer> values) {
            addCriterion("teach_id not in", values, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdBetween(Integer value1, Integer value2) {
            addCriterion("teach_id between", value1, value2, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachIdNotBetween(Integer value1, Integer value2) {
            addCriterion("teach_id not between", value1, value2, "teachId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdIsNull() {
            addCriterion("teach_teacher_id is null");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdIsNotNull() {
            addCriterion("teach_teacher_id is not null");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdEqualTo(Integer value) {
            addCriterion("teach_teacher_id =", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdNotEqualTo(Integer value) {
            addCriterion("teach_teacher_id <>", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdGreaterThan(Integer value) {
            addCriterion("teach_teacher_id >", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("teach_teacher_id >=", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdLessThan(Integer value) {
            addCriterion("teach_teacher_id <", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdLessThanOrEqualTo(Integer value) {
            addCriterion("teach_teacher_id <=", value, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdIn(List<Integer> values) {
            addCriterion("teach_teacher_id in", values, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdNotIn(List<Integer> values) {
            addCriterion("teach_teacher_id not in", values, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdBetween(Integer value1, Integer value2) {
            addCriterion("teach_teacher_id between", value1, value2, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachTeacherIdNotBetween(Integer value1, Integer value2) {
            addCriterion("teach_teacher_id not between", value1, value2, "teachTeacherId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdIsNull() {
            addCriterion("teach_class_id is null");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdIsNotNull() {
            addCriterion("teach_class_id is not null");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdEqualTo(Integer value) {
            addCriterion("teach_class_id =", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdNotEqualTo(Integer value) {
            addCriterion("teach_class_id <>", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdGreaterThan(Integer value) {
            addCriterion("teach_class_id >", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("teach_class_id >=", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdLessThan(Integer value) {
            addCriterion("teach_class_id <", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("teach_class_id <=", value, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdIn(List<Integer> values) {
            addCriterion("teach_class_id in", values, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdNotIn(List<Integer> values) {
            addCriterion("teach_class_id not in", values, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdBetween(Integer value1, Integer value2) {
            addCriterion("teach_class_id between", value1, value2, "teachClassId");
            return (Criteria) this;
        }

        public Criteria andTeachClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("teach_class_id not between", value1, value2, "teachClassId");
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