package ke.energy.view.cm.security;

import java.util.List;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;

import java.util.Iterator;  
import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.TreeModel; 


public class NavigationTreeMenuBean {
    public NavigationTreeMenuBean() {
        super();
    }
    
    public void onTreeSelect(SelectionEvent selectionEvent) {

        //original selection listener set by ADF
          //#{bindings.cmTreeMenuLevel2VO1.treeModel.makeCurrent}
          String adfSelectionListener = "#{bindings.cmTreeMenuLevel2VO1.treeModel.makeCurrent}" ;
          //make sure the default selection listener functionality is 
          //preserved. you don't need to do this for multi select trees 
          //as the ADF binding only supports single current row selection  
         
          /* START PRESERVER DEFAULT ADF SELECT BEHAVIOR */
          FacesContext fctx = FacesContext.getCurrentInstance();
          Application application = fctx.getApplication();
          ELContext elCtx = fctx.getELContext();
          ExpressionFactory exprFactory = application.getExpressionFactory();
          
          MethodExpression me = null;
          me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, 
                                                  Object.class, new Class[] { SelectionEvent.class } ); 
          me.invoke(elCtx, new Object[] { selectionEvent });  

          /* END PRESERVER DEFAULT ADF SELECT BEHAVIOR */
          RichTreeTable tree = (RichTreeTable)selectionEvent.getSource();
          TreeModel model = (TreeModel)tree.getValue();   
         
          //get selected nodes
          RowKeySet rowKeySet = selectionEvent.getAddedSet(); 
          Iterator rksIterator = rowKeySet.iterator(); 
          //for single select configurations,this only is called once 
          while (rksIterator.hasNext()) {
            List key = (List)rksIterator.next();
            JUCtrlHierBinding treeBinding = null;
            CollectionModel collectionModel = (CollectionModel)tree.getValue();
            treeBinding = (JUCtrlHierBinding)collectionModel.getWrappedData(); 
            JUCtrlHierNodeBinding nodeBinding = null;
            nodeBinding = treeBinding.findNodeByKeyPath(key);
            Row rw = nodeBinding.getRow();
            //print first row attribute. Note that in a tree you have to 
            //determine the node type if you want to select node attributes 
            //by name and not index 
            String rowType = rw.getStructureDef().getDefName();
             
            System.out.println("This is a: "+ rw.getAttribute("Type"));
              
              /*  if(rowType.equalsIgnoreCase("DepartmentsView")){
                  System.out.println("This row is a department: " +  
                                     rw.getAttribute("DepartmentId"));
                }
                else if(rowType.equalsIgnoreCase("EmployeesView")){
                 System.out.println("This row is an employee: " + 
                                     rw.getAttribute("EmployeeId"));
                }     
                else{
                  System.out.println("Huh????");  
                }
            // ... do more useful stuff here      
        */
    }
 }
}
