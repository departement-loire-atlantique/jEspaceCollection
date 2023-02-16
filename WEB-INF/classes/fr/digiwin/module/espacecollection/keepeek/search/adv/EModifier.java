package fr.digiwin.module.espacecollection.keepeek.search.adv;

public enum EModifier {
    
    CONTAINS_ALL(""),
    CONTAINS_NONE("");

    public final String lbl;

    EModifier(String lbl) {
        this.lbl = lbl;
    }
}
