SELECT node_id, menu_id parent_node_id,label child_label,level,type,taskflow_url
   FROM cm_tree_menu
START WITH menu_id IS NULL
CONNECT BY PRIOR node_id = menu_id AND LEVEL = 1
;

SELECT node_id, menu_id parent_node_id,label child_label,type,taskflow_url
FROM cm_tree_menu
   ;


select *
from cm_tree_menu;