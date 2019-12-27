def change_detection(cls):
    class attr_cls():
        def __init__(self,value,get_change='INIT'):
            self.value=value
            self.get_change=get_change
        
        def __getattr__(self,name):
            return getattr(self.value,name)
        
        def __repr__(self):
            return str(self.value)
        
        def __bool__(self):
            return bool(self.value)
        
        def __call__(self):
            return self.value()
        
        def __eq__(self,other):
            return self.value==other
        
        def __add__(self,other):
            return self.value+other
        
        def __sub__(self,other):
            return self.value-other
        
        def __mul__(self,other):
            return self.value*other

        def __truediv__(self,other):
            return self.value/other

        def __radd__(self,other):
            return other+self.value
        
        def __rsub__(self,other):
            return other-self.value
        
        def __rmul__(self,other):
            return other*self.value
        
        def __rtruediv__(self,other):
            return other/self.value
    
    def __getattribute__(self,name):
        try:
            attr=super(cls, self).__getattribute__(name)
            if type(attr)!=attr_cls:
                new_attr=attr_cls(attr)
                super(cls, self).__setattr__(name,new_attr)
                return new_attr
            return attr
        except:
            return attr_cls(None,'')

    def __setattr__(self, name, value):
        target=getattr(self,name,None)
        if type(target)!=attr_cls or not target.get_change:
            super(cls, self).__setattr__(name, attr_cls(value))
        elif target.value!=value or type(target.value)!=type(value):
            target.value=value
            target.get_change='MOD'
    
    def __delattr__(self, name):
        target=getattr(self,name)
        target.value=None
        target.get_change='DEL'
            
    setattr(cls,'__setattr__', __setattr__)
    setattr(cls,'__getattribute__', __getattribute__)
    setattr(cls,'__delattr__', __delattr__)

    return cls
