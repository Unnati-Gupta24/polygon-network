interface IERC20Custom {
    function mint(address to, uint256 amount) external;
    function burn(address from, uint256 amount) external;
    function transferWithCallback(address to, uint256 amount) external returns (bool);
    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
}
