package fr.digiwin.module.espacecollection.keepeek.search.adv;

public enum EModifier {
    
    CONTAINS_ALL("Contient le terme"),
    CONTAINS_NONE("Ne contient le terme");

    public final String lbl;

    EModifier(String lbl) {
        this.lbl = lbl;
    }
}
