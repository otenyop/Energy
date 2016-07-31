package ke.energy.view.cm.security;


import javax.faces.event.ActionEvent; 

import oracle.ui.pattern.dynamicShell.TabContext; 

/** 
 * Launcher is a backingBean-scope managed bean. The public methods are 
 * available to EL. The methods call TabContext APIs available to the 
 * Dynamic Tab Shell Template. The boolean value for _launchActivity 
 * determines whether another tab instance is created or selected. Each tab 
 * (i.e., task flow) is tracked by ID. The title is the tab label. 
 */ 

public class Launcher 
{ 
  
  public void launchFirstActivity(ActionEvent actionEvent) 
  { 
      /** 
      * Example method to call a single instance task flow. Note the boolean 
      * to create another tab instance is set to false. The taskflow ID is used 
      * to track whether to create a new tab or select an existing one. 
      */ 
    _launchActivity( 
      "The First Activity", 
      "/WEB-INF/Actors-btf.xml#Actors-btf", 
      false); 
  } 
  
  public void launchSecondActivity(ActionEvent actionEvent) 
  { 
    _launchActivity( 
      "The Second Activity Customers", 
      "/WEB-INF/Customers-btf.xml#Customers-btf", 
     false); 
  } 
  
  public void launchThirdActivity(ActionEvent actionEvent) 
  { 
    _launchActivity( 
      "Third Activity Film", 
      "/WEB-INF/Film-btf.xml#Film-btf", 
      false); 
  } 
  
  public void closeCurrentActivity(ActionEvent actionEvent) 
  { 
    TabContext tabContext = TabContext.getCurrentInstance(); 
    int tabIndex = tabContext.getSelectedTabIndex(); 
    if (tabIndex != -1) 
    { 
      tabContext.removeTab(tabIndex); 
    } 
  } 
  
    public void currentTabDirty(ActionEvent e) 
    { 
        /** 
        * When called, marks the current tab "dirty". Only at the View level 
        * is it possible to mark a tab dirty since the model level does not 
        * track to which tab data belongs. 
        */ 
      TabContext tabContext = TabContext.getCurrentInstance(); 
      tabContext.markCurrentTabDirty(true); 
    }  
  
    public void currentTabClean(ActionEvent e) 
    { 
      TabContext tabContext = TabContext.getCurrentInstance(); 
      tabContext.markCurrentTabDirty(false); 
    } 
       
  private void _launchActivity(String title, String taskflowId, boolean newTab) 
  { 
    try 
    { 
      if (newTab) 
      { 
        TabContext.getCurrentInstance().addTab( 
          title, 
          taskflowId); 
      } 
      else 
      { 
        TabContext.getCurrentInstance().addOrSelectTab( 
          title, 
          taskflowId); 
      } 
    } 
    catch (TabContext.TabOverflowException toe) 
    { 
      // causes a dialog to be displayed to the user saying that there are 
      // too many tabs open - the new tab will not be opened... 
      toe.handleDefault();  
    } 
  }


    public void newMethod(ActionEvent actionEvent) {
        // Add event code here...
    }
}
