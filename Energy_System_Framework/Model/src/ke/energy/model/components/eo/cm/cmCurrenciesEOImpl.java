package ke.energy.model.components.eo.cm;

import java.sql.Timestamp;

import java.util.Date;

import ke.energy.common.baseclasses.EntityImpl;

import oracle.jbo.Key;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.TransactionEvent;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Fri Jun 24 17:34:12 EAT 2016
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class cmCurrenciesEOImpl extends EntityImpl {

    /**
     * Add locking logic here.
     */
    public void lock() {
        super.lock();
    }

    /**
     * Custom DML update/insert/delete logic here.
     * @param operation the operation type
     * @param e the transaction event
     */
    protected void doDML(int operation, TransactionEvent e) {
        
        Date date = new Date();
        
        if (operation==DML_INSERT){
            this.setCreatedBy(new Long(2));
            this.setCreationDate(new Timestamp(date.getTime()));
            this.setLastUpdateDate(new Timestamp(date.getTime()));
            this.setLastUpdatedBy(new Long(2));
            this.setLastUpdateLogin(new Long(100));
            
        } else if (operation==DML_UPDATE){
            this.setLastUpdateDate(new Timestamp(date.getTime()) );
            this.setLastUpdatedBy(new Long(2));
            this.setLastUpdateLogin(new Long(100));             
        }
        
        super.doDML(operation, e);
    }


    @Override
    protected void initDefaults() {
        Date date = new Date();
        
        super.initDefaults();
        this.setCreatedBy(new Long(1));
        this.setCreationDate(new Timestamp(date.getTime()));
        this.setLastUpdateDate(new Timestamp(date.getTime()));
        this.setLastUpdatedBy(new Long(1));
        this.setLastUpdateLogin(new Long(1));
        
    }


    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        CurrencyCode,
        Name,
        Description,
        EnabledFlag,
        Precision,
        ExtendedPrecision,
        Symbol,
        StartDateActive,
        EndDateActive,
        CreationDate,
        CreatedBy,
        LastUpdateDate,
        LastUpdatedBy,
        LastUpdateLogin;
        private static AttributesEnum[] vals = null;
        private static final int firstIndex = 0;

        public int index() {
            return AttributesEnum.firstIndex() + ordinal();
        }

        public static final int firstIndex() {
            return firstIndex;
        }

        public static int count() {
            return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
        }

        public static final AttributesEnum[] staticValues() {
            if (vals == null) {
                vals = AttributesEnum.values();
            }
            return vals;
        }
    }

    public static final int CURRENCYCODE = AttributesEnum.CurrencyCode.index();
    public static final int NAME = AttributesEnum.Name.index();
    public static final int DESCRIPTION = AttributesEnum.Description.index();
    public static final int ENABLEDFLAG = AttributesEnum.EnabledFlag.index();
    public static final int PRECISION = AttributesEnum.Precision.index();
    public static final int EXTENDEDPRECISION = AttributesEnum.ExtendedPrecision.index();
    public static final int SYMBOL = AttributesEnum.Symbol.index();
    public static final int STARTDATEACTIVE = AttributesEnum.StartDateActive.index();
    public static final int ENDDATEACTIVE = AttributesEnum.EndDateActive.index();
    public static final int CREATIONDATE = AttributesEnum.CreationDate.index();
    public static final int CREATEDBY = AttributesEnum.CreatedBy.index();
    public static final int LASTUPDATEDATE = AttributesEnum.LastUpdateDate.index();
    public static final int LASTUPDATEDBY = AttributesEnum.LastUpdatedBy.index();
    public static final int LASTUPDATELOGIN = AttributesEnum.LastUpdateLogin.index();

    /**
     * This is the default constructor (do not remove).
     */
    public cmCurrenciesEOImpl() {
    }

    /**
     * @return the definition object for this instance class.
     */
    public static synchronized EntityDefImpl getDefinitionObject() {
        return EntityDefImpl.findDefObject("ke.energy.model.components.eo.cm.cmCurrenciesEO");
    }

    /**
     * Gets the attribute value for CurrencyCode, using the alias name CurrencyCode.
     * @return the value of CurrencyCode
     */
    public String getCurrencyCode() {
        return (String) getAttributeInternal(CURRENCYCODE);
    }

    /**
     * Sets <code>value</code> as the attribute value for CurrencyCode.
     * @param value value to set the CurrencyCode
     */
    public void setCurrencyCode(String value) {
        setAttributeInternal(CURRENCYCODE, value);
    }

    /**
     * Gets the attribute value for Name, using the alias name Name.
     * @return the value of Name
     */
    public String getName() {
        return (String) getAttributeInternal(NAME);
    }

    /**
     * Sets <code>value</code> as the attribute value for Name.
     * @param value value to set the Name
     */
    public void setName(String value) {
        setAttributeInternal(NAME, value);
    }

    /**
     * Gets the attribute value for Description, using the alias name Description.
     * @return the value of Description
     */
    public String getDescription() {
        return (String) getAttributeInternal(DESCRIPTION);
    }

    /**
     * Sets <code>value</code> as the attribute value for Description.
     * @param value value to set the Description
     */
    public void setDescription(String value) {
        setAttributeInternal(DESCRIPTION, value);
    }

    /**
     * Gets the attribute value for EnabledFlag, using the alias name EnabledFlag.
     * @return the value of EnabledFlag
     */
    public String getEnabledFlag() {
        return (String) getAttributeInternal(ENABLEDFLAG);
    }

    /**
     * Sets <code>value</code> as the attribute value for EnabledFlag.
     * @param value value to set the EnabledFlag
     */
    public void setEnabledFlag(String value) {
        setAttributeInternal(ENABLEDFLAG, value);
    }

    /**
     * Gets the attribute value for Precision, using the alias name Precision.
     * @return the value of Precision
     */
    public Integer getPrecision() {
        return (Integer) getAttributeInternal(PRECISION);
    }

    /**
     * Sets <code>value</code> as the attribute value for Precision.
     * @param value value to set the Precision
     */
    public void setPrecision(Integer value) {
        setAttributeInternal(PRECISION, value);
    }

    /**
     * Gets the attribute value for ExtendedPrecision, using the alias name ExtendedPrecision.
     * @return the value of ExtendedPrecision
     */
    public Integer getExtendedPrecision() {
        return (Integer) getAttributeInternal(EXTENDEDPRECISION);
    }

    /**
     * Sets <code>value</code> as the attribute value for ExtendedPrecision.
     * @param value value to set the ExtendedPrecision
     */
    public void setExtendedPrecision(Integer value) {
        setAttributeInternal(EXTENDEDPRECISION, value);
    }

    /**
     * Gets the attribute value for Symbol, using the alias name Symbol.
     * @return the value of Symbol
     */
    public String getSymbol() {
        return (String) getAttributeInternal(SYMBOL);
    }

    /**
     * Sets <code>value</code> as the attribute value for Symbol.
     * @param value value to set the Symbol
     */
    public void setSymbol(String value) {
        setAttributeInternal(SYMBOL, value);
    }

    /**
     * Gets the attribute value for StartDateActive, using the alias name StartDateActive.
     * @return the value of StartDateActive
     */
    public Timestamp getStartDateActive() {
        return (Timestamp) getAttributeInternal(STARTDATEACTIVE);
    }

    /**
     * Sets <code>value</code> as the attribute value for StartDateActive.
     * @param value value to set the StartDateActive
     */
    public void setStartDateActive(Timestamp value) {
        setAttributeInternal(STARTDATEACTIVE, value);
    }

    /**
     * Gets the attribute value for EndDateActive, using the alias name EndDateActive.
     * @return the value of EndDateActive
     */
    public Timestamp getEndDateActive() {
        return (Timestamp) getAttributeInternal(ENDDATEACTIVE);
    }

    /**
     * Sets <code>value</code> as the attribute value for EndDateActive.
     * @param value value to set the EndDateActive
     */
    public void setEndDateActive(Timestamp value) {
        setAttributeInternal(ENDDATEACTIVE, value);
    }

    /**
     * Gets the attribute value for CreationDate, using the alias name CreationDate.
     * @return the value of CreationDate
     */
    public Timestamp getCreationDate() {
        return (Timestamp) getAttributeInternal(CREATIONDATE);
    }

    /**
     * Sets <code>value</code> as the attribute value for CreationDate.
     * @param value value to set the CreationDate
     */
    public void setCreationDate(Timestamp value) {
        setAttributeInternal(CREATIONDATE, value);
    }

    /**
     * Gets the attribute value for CreatedBy, using the alias name CreatedBy.
     * @return the value of CreatedBy
     */
    public Long getCreatedBy() {
        return (Long) getAttributeInternal(CREATEDBY);
    }

    /**
     * Sets <code>value</code> as the attribute value for CreatedBy.
     * @param value value to set the CreatedBy
     */
    public void setCreatedBy(Long value) {
        setAttributeInternal(CREATEDBY, value);
    }

    /**
     * Gets the attribute value for LastUpdateDate, using the alias name LastUpdateDate.
     * @return the value of LastUpdateDate
     */
    public Timestamp getLastUpdateDate() {
        return (Timestamp) getAttributeInternal(LASTUPDATEDATE);
    }

    /**
     * Sets <code>value</code> as the attribute value for LastUpdateDate.
     * @param value value to set the LastUpdateDate
     */
    public void setLastUpdateDate(Timestamp value) {
        setAttributeInternal(LASTUPDATEDATE, value);
    }

    /**
     * Gets the attribute value for LastUpdatedBy, using the alias name LastUpdatedBy.
     * @return the value of LastUpdatedBy
     */
    public Long getLastUpdatedBy() {
        return (Long) getAttributeInternal(LASTUPDATEDBY);
    }

    /**
     * Sets <code>value</code> as the attribute value for LastUpdatedBy.
     * @param value value to set the LastUpdatedBy
     */
    public void setLastUpdatedBy(Long value) {
        setAttributeInternal(LASTUPDATEDBY, value);
    }

    /**
     * Gets the attribute value for LastUpdateLogin, using the alias name LastUpdateLogin.
     * @return the value of LastUpdateLogin
     */
    public Long getLastUpdateLogin() {
        return (Long) getAttributeInternal(LASTUPDATELOGIN);
    }

    /**
     * Sets <code>value</code> as the attribute value for LastUpdateLogin.
     * @param value value to set the LastUpdateLogin
     */
    public void setLastUpdateLogin(Long value) {
        setAttributeInternal(LASTUPDATELOGIN, value);
    }

    /**
     * @param currencyCode key constituent

     * @return a Key object based on given key constituents.
     */
    public static Key createPrimaryKey(String currencyCode) {
        return new Key(new Object[] { currencyCode });
    }


}

