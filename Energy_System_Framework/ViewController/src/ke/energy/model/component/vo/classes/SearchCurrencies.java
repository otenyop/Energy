package ke.energy.model.component.vo.classes;

import java.util.Map;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;


public class SearchCurrencies {
    public SearchCurrencies() {
    }
    private String pfCurrencyCode;
    
    public BindingContainer getContainer(){
        return BindingContext.getCurrent().getCurrentBindingsEntry();
        }
    public void SearchCurrenciesMethod(ActionEvent actionEvent) {
        BindingContainer bc = this.getContainer();
        OperationBinding ob = bc.getOperationBinding("searchCurrenciesVO");
        Map m               = ob.getParamsMap();
        m.put("pCurrencyCode", pfCurrencyCode);
        ob.execute();
    }

    public void setPfCurrencyCode(String pfCurrencyCode) {
        this.pfCurrencyCode = pfCurrencyCode;
    }

    public String getPfCurrencyCode() {
        return pfCurrencyCode;
    }
}
