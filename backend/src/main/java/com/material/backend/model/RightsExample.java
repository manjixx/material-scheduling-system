package com.material.backend.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RightsExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public RightsExample() {
        oredCriteria = new ArrayList<>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRightsNameIsNull() {
            addCriterion("rights_name is null");
            return (Criteria) this;
        }

        public Criteria andRightsNameIsNotNull() {
            addCriterion("rights_name is not null");
            return (Criteria) this;
        }

        public Criteria andRightsNameEqualTo(String value) {
            addCriterion("rights_name =", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameNotEqualTo(String value) {
            addCriterion("rights_name <>", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameGreaterThan(String value) {
            addCriterion("rights_name >", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameGreaterThanOrEqualTo(String value) {
            addCriterion("rights_name >=", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameLessThan(String value) {
            addCriterion("rights_name <", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameLessThanOrEqualTo(String value) {
            addCriterion("rights_name <=", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameLike(String value) {
            addCriterion("rights_name like", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameNotLike(String value) {
            addCriterion("rights_name not like", value, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameIn(List<String> values) {
            addCriterion("rights_name in", values, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameNotIn(List<String> values) {
            addCriterion("rights_name not in", values, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameBetween(String value1, String value2) {
            addCriterion("rights_name between", value1, value2, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsNameNotBetween(String value1, String value2) {
            addCriterion("rights_name not between", value1, value2, "rightsName");
            return (Criteria) this;
        }

        public Criteria andRightsDescIsNull() {
            addCriterion("rights_desc is null");
            return (Criteria) this;
        }

        public Criteria andRightsDescIsNotNull() {
            addCriterion("rights_desc is not null");
            return (Criteria) this;
        }

        public Criteria andRightsDescEqualTo(String value) {
            addCriterion("rights_desc =", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescNotEqualTo(String value) {
            addCriterion("rights_desc <>", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescGreaterThan(String value) {
            addCriterion("rights_desc >", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescGreaterThanOrEqualTo(String value) {
            addCriterion("rights_desc >=", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescLessThan(String value) {
            addCriterion("rights_desc <", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescLessThanOrEqualTo(String value) {
            addCriterion("rights_desc <=", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescLike(String value) {
            addCriterion("rights_desc like", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescNotLike(String value) {
            addCriterion("rights_desc not like", value, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescIn(List<String> values) {
            addCriterion("rights_desc in", values, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescNotIn(List<String> values) {
            addCriterion("rights_desc not in", values, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescBetween(String value1, String value2) {
            addCriterion("rights_desc between", value1, value2, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsDescNotBetween(String value1, String value2) {
            addCriterion("rights_desc not between", value1, value2, "rightsDesc");
            return (Criteria) this;
        }

        public Criteria andRightsStateIsNull() {
            addCriterion("rights_state is null");
            return (Criteria) this;
        }

        public Criteria andRightsStateIsNotNull() {
            addCriterion("rights_state is not null");
            return (Criteria) this;
        }

        public Criteria andRightsStateEqualTo(Boolean value) {
            addCriterion("rights_state =", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateNotEqualTo(Boolean value) {
            addCriterion("rights_state <>", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateGreaterThan(Boolean value) {
            addCriterion("rights_state >", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateGreaterThanOrEqualTo(Boolean value) {
            addCriterion("rights_state >=", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateLessThan(Boolean value) {
            addCriterion("rights_state <", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateLessThanOrEqualTo(Boolean value) {
            addCriterion("rights_state <=", value, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateIn(List<Boolean> values) {
            addCriterion("rights_state in", values, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateNotIn(List<Boolean> values) {
            addCriterion("rights_state not in", values, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateBetween(Boolean value1, Boolean value2) {
            addCriterion("rights_state between", value1, value2, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsStateNotBetween(Boolean value1, Boolean value2) {
            addCriterion("rights_state not between", value1, value2, "rightsState");
            return (Criteria) this;
        }

        public Criteria andRightsTypeIsNull() {
            addCriterion("rights_type is null");
            return (Criteria) this;
        }

        public Criteria andRightsTypeIsNotNull() {
            addCriterion("rights_type is not null");
            return (Criteria) this;
        }

        public Criteria andRightsTypeEqualTo(String value) {
            addCriterion("rights_type =", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeNotEqualTo(String value) {
            addCriterion("rights_type <>", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeGreaterThan(String value) {
            addCriterion("rights_type >", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeGreaterThanOrEqualTo(String value) {
            addCriterion("rights_type >=", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeLessThan(String value) {
            addCriterion("rights_type <", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeLessThanOrEqualTo(String value) {
            addCriterion("rights_type <=", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeLike(String value) {
            addCriterion("rights_type like", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeNotLike(String value) {
            addCriterion("rights_type not like", value, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeIn(List<String> values) {
            addCriterion("rights_type in", values, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeNotIn(List<String> values) {
            addCriterion("rights_type not in", values, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeBetween(String value1, String value2) {
            addCriterion("rights_type between", value1, value2, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsTypeNotBetween(String value1, String value2) {
            addCriterion("rights_type not between", value1, value2, "rightsType");
            return (Criteria) this;
        }

        public Criteria andRightsPathIsNull() {
            addCriterion("rights_path is null");
            return (Criteria) this;
        }

        public Criteria andRightsPathIsNotNull() {
            addCriterion("rights_path is not null");
            return (Criteria) this;
        }

        public Criteria andRightsPathEqualTo(String value) {
            addCriterion("rights_path =", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathNotEqualTo(String value) {
            addCriterion("rights_path <>", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathGreaterThan(String value) {
            addCriterion("rights_path >", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathGreaterThanOrEqualTo(String value) {
            addCriterion("rights_path >=", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathLessThan(String value) {
            addCriterion("rights_path <", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathLessThanOrEqualTo(String value) {
            addCriterion("rights_path <=", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathLike(String value) {
            addCriterion("rights_path like", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathNotLike(String value) {
            addCriterion("rights_path not like", value, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathIn(List<String> values) {
            addCriterion("rights_path in", values, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathNotIn(List<String> values) {
            addCriterion("rights_path not in", values, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathBetween(String value1, String value2) {
            addCriterion("rights_path between", value1, value2, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andRightsPathNotBetween(String value1, String value2) {
            addCriterion("rights_path not between", value1, value2, "rightsPath");
            return (Criteria) this;
        }

        public Criteria andPidIsNull() {
            addCriterion("pid is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("pid is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("pid =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("pid <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("pid >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("pid >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("pid <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("pid <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("pid in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("pid not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("pid between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("pid not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andLevelIsNull() {
            addCriterion("level is null");
            return (Criteria) this;
        }

        public Criteria andLevelIsNotNull() {
            addCriterion("level is not null");
            return (Criteria) this;
        }

        public Criteria andLevelEqualTo(Integer value) {
            addCriterion("level =", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotEqualTo(Integer value) {
            addCriterion("level <>", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelGreaterThan(Integer value) {
            addCriterion("level >", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("level >=", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelLessThan(Integer value) {
            addCriterion("level <", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelLessThanOrEqualTo(Integer value) {
            addCriterion("level <=", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelIn(List<Integer> values) {
            addCriterion("level in", values, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotIn(List<Integer> values) {
            addCriterion("level not in", values, "level");
            return (Criteria) this;
        }

        public Criteria andLevelBetween(Integer value1, Integer value2) {
            addCriterion("level between", value1, value2, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("level not between", value1, value2, "level");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIsNull() {
            addCriterion("created_at is null");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIsNotNull() {
            addCriterion("created_at is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedAtEqualTo(Date value) {
            addCriterion("created_at =", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotEqualTo(Date value) {
            addCriterion("created_at <>", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtGreaterThan(Date value) {
            addCriterion("created_at >", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtGreaterThanOrEqualTo(Date value) {
            addCriterion("created_at >=", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtLessThan(Date value) {
            addCriterion("created_at <", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtLessThanOrEqualTo(Date value) {
            addCriterion("created_at <=", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIn(List<Date> values) {
            addCriterion("created_at in", values, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotIn(List<Date> values) {
            addCriterion("created_at not in", values, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtBetween(Date value1, Date value2) {
            addCriterion("created_at between", value1, value2, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotBetween(Date value1, Date value2) {
            addCriterion("created_at not between", value1, value2, "createdAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIsNull() {
            addCriterion("updated_at is null");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIsNotNull() {
            addCriterion("updated_at is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtEqualTo(Date value) {
            addCriterion("updated_at =", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotEqualTo(Date value) {
            addCriterion("updated_at <>", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtGreaterThan(Date value) {
            addCriterion("updated_at >", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtGreaterThanOrEqualTo(Date value) {
            addCriterion("updated_at >=", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtLessThan(Date value) {
            addCriterion("updated_at <", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtLessThanOrEqualTo(Date value) {
            addCriterion("updated_at <=", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIn(List<Date> values) {
            addCriterion("updated_at in", values, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotIn(List<Date> values) {
            addCriterion("updated_at not in", values, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtBetween(Date value1, Date value2) {
            addCriterion("updated_at between", value1, value2, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotBetween(Date value1, Date value2) {
            addCriterion("updated_at not between", value1, value2, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andRightsMethodIsNull() {
            addCriterion("rights_method is null");
            return (Criteria) this;
        }

        public Criteria andRightsMethodIsNotNull() {
            addCriterion("rights_method is not null");
            return (Criteria) this;
        }

        public Criteria andRightsMethodEqualTo(String value) {
            addCriterion("rights_method =", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodNotEqualTo(String value) {
            addCriterion("rights_method <>", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodGreaterThan(String value) {
            addCriterion("rights_method >", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodGreaterThanOrEqualTo(String value) {
            addCriterion("rights_method >=", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodLessThan(String value) {
            addCriterion("rights_method <", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodLessThanOrEqualTo(String value) {
            addCriterion("rights_method <=", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodLike(String value) {
            addCriterion("rights_method like", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodNotLike(String value) {
            addCriterion("rights_method not like", value, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodIn(List<String> values) {
            addCriterion("rights_method in", values, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodNotIn(List<String> values) {
            addCriterion("rights_method not in", values, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodBetween(String value1, String value2) {
            addCriterion("rights_method between", value1, value2, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsMethodNotBetween(String value1, String value2) {
            addCriterion("rights_method not between", value1, value2, "rightsMethod");
            return (Criteria) this;
        }

        public Criteria andRightsIconIsNull() {
            addCriterion("rights_icon is null");
            return (Criteria) this;
        }

        public Criteria andRightsIconIsNotNull() {
            addCriterion("rights_icon is not null");
            return (Criteria) this;
        }

        public Criteria andRightsIconEqualTo(String value) {
            addCriterion("rights_icon =", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconNotEqualTo(String value) {
            addCriterion("rights_icon <>", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconGreaterThan(String value) {
            addCriterion("rights_icon >", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconGreaterThanOrEqualTo(String value) {
            addCriterion("rights_icon >=", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconLessThan(String value) {
            addCriterion("rights_icon <", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconLessThanOrEqualTo(String value) {
            addCriterion("rights_icon <=", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconLike(String value) {
            addCriterion("rights_icon like", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconNotLike(String value) {
            addCriterion("rights_icon not like", value, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconIn(List<String> values) {
            addCriterion("rights_icon in", values, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconNotIn(List<String> values) {
            addCriterion("rights_icon not in", values, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconBetween(String value1, String value2) {
            addCriterion("rights_icon between", value1, value2, "rightsIcon");
            return (Criteria) this;
        }

        public Criteria andRightsIconNotBetween(String value1, String value2) {
            addCriterion("rights_icon not between", value1, value2, "rightsIcon");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table rights
     *
     * @mbg.generated do_not_delete_during_merge Fri May 20 17:45:33 CST 2022
     */
    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table rights
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
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