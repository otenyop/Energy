package ke.energy.view.security;


import javax.servlet.http.HttpSession;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

public class EnergySessionAttributes {
    public EnergySessionAttributes() {
        super();
    }
    
    public void setEnergySessionAttributes(){
        FacesContext fctx       = FacesContext.getCurrentInstance();
        ExternalContext ectx    = fctx.getExternalContext();
        HttpSession userSession = (HttpSession) ectx.getSession(false);
        userSession.setAttribute("userId", new Integer(1000));
        }    
}
