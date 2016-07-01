package ke.energy.view.cm.currencies;

import java.util.Iterator;

import oracle.adf.share.logging.ADFLogger;
import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.jbo.Row;

import oracle.binding.BindingContainer;
import oracle.binding.AttributeBinding;

import oracle.jbo.ViewObject;


public class CmCurrenciesAuthorization {
    private static ADFLogger _logger = ADFLogger.createADFLogger(CmCurrenciesAuthorization.class);
 
    public CmCurrenciesAuthorization() {
        super();
    }

    //isCreateAllowed() to check if the User has rights to Create Object
    public boolean isCreateAllowed(){
        return true;
        }
    
  
    //isCurrencyCodeUpdateAllowed() to check if the User has rights to Edit Currency Code
    public boolean isCurrencyCodeUpdateAllowed(){
        BindingContext bctx         = BindingContext.getCurrent(); 
        BindingContainer bindings   = bctx.getCurrentBindingsEntry();
        AttributeBinding currencyCodeBinding =  
                (AttributeBinding)bindings.getControlBinding("CurrencyCode");
        
        DCIteratorBinding iter =
                (DCIteratorBinding) bindings.get("cmCurrenciesVO1Iterator");
        
        Row r = iter.getCurrentRow();
        Integer rowStatus =  (Integer)r.getAttribute("CheckRowStatus") ;
        
        //If Record is still not yet committed to DB then always allow for editing
        if (rowStatus == 0) {
             return true;
            } 
            
                    //Check if Currency Code is has a value.This applies to commited data only
                    try{
                        if (!currencyCodeBinding.getInputValue().toString().isEmpty() ) {
                             return false;                
                            }
                    }catch(NullPointerException e)
                    {
                     return true;    
                    }
                
        return true;
        }
      
    //isUpdateAllowed() to check if the User has rights to Edit Object
    public boolean isUpdateAllowed(){
        
        return true;
        }
    
    //isSaveApprovalRequired() to check if Save Approval is required
    public boolean isSaveApprovalRequired(){
        return false ;
        }    
    
    //isDeleteAllowed() to check if User has rights to Delete Object
    public boolean isDeleteAllowed(){
         return false ;
        }
}
