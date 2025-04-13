namespace FaculdadeVINCIT.DesignPatterns.BuilderPatterns;

public class SanduicheBuilder
{
    private string _pao;
    private string _carne;
    private string _queijo;
    private bool _temSalada;

    public SanduicheBuilder SetPao (string Pao) {
        this._pao = Pao;
        return this;
    }

    public SanduicheBuilder SetCarne (string Carne) {
        this._carne = Carne;
        return this;
    }

    public SanduicheBuilder SetQueijo (string Queijo) {
        this._queijo = Queijo;
        return this;
    }

    public SanduicheBuilder SetSalada (bool TemSalada) {
        this._temSalada = TemSalada;
        return this;
    }

    public Sanduiche Build() {
        var sanduiche = new Sanduiche(_pao, _carne, _queijo, _temSalada);
        return sanduiche;
    }
}
