package ke.energy.view.cm.security;

import java.util.ArrayList;
import java.util.List;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;

import java.util.Iterator;  
import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.RowKeySetTreeImpl;
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
          
         
          //get selected nodes
          RowKeySet rowKeySet = selectionEvent.getAddedSet(); 

          Iterator rksIterator = rowKeySet.iterator(); 
          //for single select configurations,this only is called once 
          while (rksIterator.hasNext()) {
              
            //a key is a list object that contains the node path information 
            //for the selected node  
            List key = (List)rksIterator.next();
            
            //determine the selected node. Note that the tree table binding is 
            //an instance of JUCtrlHierBinding  
            JUCtrlHierBinding treeBinding = null;
              
              
            //get access to the Tree Collection Model. The tree component 
            //instance is accessed through its binding property reference 
            //to this managed bean
            CollectionModel collectionModel = (CollectionModel)tree.getValue();
              
            //We can get the binding information without using EL in our Java, 
            //which you always should try to do. Using EL in Java is good to 
            //use, but only second best as a solution   
            treeBinding = (JUCtrlHierBinding)collectionModel.getWrappedData(); 
              
            //the row data is represented by the JUCtrlHierNodeBinding class at 
            //runtime. We get the node value from the tree binding at runtime   
            JUCtrlHierNodeBinding nodeBinding = null;
            nodeBinding = treeBinding.findNodeByKeyPath(key);
            Row rw = nodeBinding.getRow();
                
             
            // Get the type of Tree Entry for appropriate Action later 
            String nodeType =  (String) rw.getAttribute("Type");
              
              if (nodeType.equalsIgnoreCase("menu")){
                   System.out.println("This is a Menu : "+ rw.getAttribute("ChildLabel"));
                   
                      List newKeys = new ArrayList();
                      
                       //nodeBinding.getKeyPath().isEmpty()
                    
                        /*  if (nodeBinding.hasChildren()) { //Collapse the tree if it has Children already
                                                            
                          //      tree.getDisclosedRowKeys().clear();
                          //      AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());
                          //      AdfFacesContext.getCurrentInstance().addPartialTarget(tree);  
                         //     
                         //     }
                        */
                         // else { // Expand the tree node
                              
                              //Get node in a tree to disclose
                              newKeys.add(nodeBinding.getKeyPath());
                              
                              //ready to disclose
                              tree.getDisclosedRowKeys().remove();
                              tree.getDisclosedRowKeys().addAll(newKeys);
                            
                              //Refresh the tree
                              //AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());
                              AdfFacesContext.getCurrentInstance().addPartialTarget(tree);  
                              
                          //}
                  }
              else if (nodeType.equalsIgnoreCase("item")){
                   System.out.println("This is a Node Item with URL "+ rw.getAttribute("TaskflowUrl"));
                  }
              else {
                    System.out.println("Found none !");
                  }
    }
 }
}


// on Collapse nodes  

//    public String onCollapse() {
//        treeTable.getDisclosedRowKeys().clear();
//        AdfFacesContext.getCurrentInstance().addPartialTarget(treeTable);
//        return null;
//    }

