public class Singleton {
    private static volatile Singleton INSTANCE = null;

    // Private constructor suppresses 
    // default public constructor
    private Singleton() {}

    //thread safe and performance  promote 
    public static  Singleton getInstance() {
        if(INSTANCE == null){
            // 双重检查 同步
            synchronized(Singleton.class){
                //when more than two threads run into the first null check same time, to avoid instanced more than one time, it needs to be checked again.
                if(INSTANCE == null){ 
                    INSTANCE = new Singleton();
                }
            } 
        }
        return INSTANCE;
    }
}
