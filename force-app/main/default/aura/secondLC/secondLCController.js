({
    handleClick : function(component, event, helper) {
        //component.set("v.message", "Button Clicked");
        var btn = event.getSource();
        var msg = btn.get("v.label");
        if(msg == "First Button"){
            component.set("v.message", msg);
        }else{
            component.set("v.message1", msg);
        }   
    }

})