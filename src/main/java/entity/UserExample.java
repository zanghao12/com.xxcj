package entity;

import java.util.ArrayList;
import java.util.List;

public class UserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserExample() {
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

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUnameIsNull() {
            addCriterion("uname is null");
            return (Criteria) this;
        }

        public Criteria andUnameIsNotNull() {
            addCriterion("uname is not null");
            return (Criteria) this;
        }

        public Criteria andUnameEqualTo(String value) {
            addCriterion("uname =", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotEqualTo(String value) {
            addCriterion("uname <>", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThan(String value) {
            addCriterion("uname >", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThanOrEqualTo(String value) {
            addCriterion("uname >=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThan(String value) {
            addCriterion("uname <", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThanOrEqualTo(String value) {
            addCriterion("uname <=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLike(String value) {
            addCriterion("uname like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotLike(String value) {
            addCriterion("uname not like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameIn(List<String> values) {
            addCriterion("uname in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotIn(List<String> values) {
            addCriterion("uname not in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameBetween(String value1, String value2) {
            addCriterion("uname between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotBetween(String value1, String value2) {
            addCriterion("uname not between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andPasswdIsNull() {
            addCriterion("passwd is null");
            return (Criteria) this;
        }

        public Criteria andPasswdIsNotNull() {
            addCriterion("passwd is not null");
            return (Criteria) this;
        }

        public Criteria andPasswdEqualTo(String value) {
            addCriterion("passwd =", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdNotEqualTo(String value) {
            addCriterion("passwd <>", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdGreaterThan(String value) {
            addCriterion("passwd >", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdGreaterThanOrEqualTo(String value) {
            addCriterion("passwd >=", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdLessThan(String value) {
            addCriterion("passwd <", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdLessThanOrEqualTo(String value) {
            addCriterion("passwd <=", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdLike(String value) {
            addCriterion("passwd like", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdNotLike(String value) {
            addCriterion("passwd not like", value, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdIn(List<String> values) {
            addCriterion("passwd in", values, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdNotIn(List<String> values) {
            addCriterion("passwd not in", values, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdBetween(String value1, String value2) {
            addCriterion("passwd between", value1, value2, "passwd");
            return (Criteria) this;
        }

        public Criteria andPasswdNotBetween(String value1, String value2) {
            addCriterion("passwd not between", value1, value2, "passwd");
            return (Criteria) this;
        }

        public Criteria andQuestionIsNull() {
            addCriterion("question is null");
            return (Criteria) this;
        }

        public Criteria andQuestionIsNotNull() {
            addCriterion("question is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionEqualTo(Integer value) {
            addCriterion("question =", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotEqualTo(Integer value) {
            addCriterion("question <>", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionGreaterThan(Integer value) {
            addCriterion("question >", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionGreaterThanOrEqualTo(Integer value) {
            addCriterion("question >=", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionLessThan(Integer value) {
            addCriterion("question <", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionLessThanOrEqualTo(Integer value) {
            addCriterion("question <=", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionIn(List<Integer> values) {
            addCriterion("question in", values, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotIn(List<Integer> values) {
            addCriterion("question not in", values, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionBetween(Integer value1, Integer value2) {
            addCriterion("question between", value1, value2, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotBetween(Integer value1, Integer value2) {
            addCriterion("question not between", value1, value2, "question");
            return (Criteria) this;
        }

        public Criteria andDaIsNull() {
            addCriterion("da is null");
            return (Criteria) this;
        }

        public Criteria andDaIsNotNull() {
            addCriterion("da is not null");
            return (Criteria) this;
        }

        public Criteria andDaEqualTo(String value) {
            addCriterion("da =", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaNotEqualTo(String value) {
            addCriterion("da <>", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaGreaterThan(String value) {
            addCriterion("da >", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaGreaterThanOrEqualTo(String value) {
            addCriterion("da >=", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaLessThan(String value) {
            addCriterion("da <", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaLessThanOrEqualTo(String value) {
            addCriterion("da <=", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaLike(String value) {
            addCriterion("da like", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaNotLike(String value) {
            addCriterion("da not like", value, "da");
            return (Criteria) this;
        }

        public Criteria andDaIn(List<String> values) {
            addCriterion("da in", values, "da");
            return (Criteria) this;
        }

        public Criteria andDaNotIn(List<String> values) {
            addCriterion("da not in", values, "da");
            return (Criteria) this;
        }

        public Criteria andDaBetween(String value1, String value2) {
            addCriterion("da between", value1, value2, "da");
            return (Criteria) this;
        }

        public Criteria andDaNotBetween(String value1, String value2) {
            addCriterion("da not between", value1, value2, "da");
            return (Criteria) this;
        }

        public Criteria andCoutIsNull() {
            addCriterion("cout is null");
            return (Criteria) this;
        }

        public Criteria andCoutIsNotNull() {
            addCriterion("cout is not null");
            return (Criteria) this;
        }

        public Criteria andCoutEqualTo(Integer value) {
            addCriterion("cout =", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutNotEqualTo(Integer value) {
            addCriterion("cout <>", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutGreaterThan(Integer value) {
            addCriterion("cout >", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutGreaterThanOrEqualTo(Integer value) {
            addCriterion("cout >=", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutLessThan(Integer value) {
            addCriterion("cout <", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutLessThanOrEqualTo(Integer value) {
            addCriterion("cout <=", value, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutIn(List<Integer> values) {
            addCriterion("cout in", values, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutNotIn(List<Integer> values) {
            addCriterion("cout not in", values, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutBetween(Integer value1, Integer value2) {
            addCriterion("cout between", value1, value2, "cout");
            return (Criteria) this;
        }

        public Criteria andCoutNotBetween(Integer value1, Integer value2) {
            addCriterion("cout not between", value1, value2, "cout");
            return (Criteria) this;
        }

        public Criteria andUroleIsNull() {
            addCriterion("urole is null");
            return (Criteria) this;
        }

        public Criteria andUroleIsNotNull() {
            addCriterion("urole is not null");
            return (Criteria) this;
        }

        public Criteria andUroleEqualTo(Integer value) {
            addCriterion("urole =", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleNotEqualTo(Integer value) {
            addCriterion("urole <>", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleGreaterThan(Integer value) {
            addCriterion("urole >", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleGreaterThanOrEqualTo(Integer value) {
            addCriterion("urole >=", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleLessThan(Integer value) {
            addCriterion("urole <", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleLessThanOrEqualTo(Integer value) {
            addCriterion("urole <=", value, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleIn(List<Integer> values) {
            addCriterion("urole in", values, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleNotIn(List<Integer> values) {
            addCriterion("urole not in", values, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleBetween(Integer value1, Integer value2) {
            addCriterion("urole between", value1, value2, "urole");
            return (Criteria) this;
        }

        public Criteria andUroleNotBetween(Integer value1, Integer value2) {
            addCriterion("urole not between", value1, value2, "urole");
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