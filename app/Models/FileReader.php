<?php


class FileReader implements SeekableIterator
{
    //position in file
    private $position;
    // file line array
    private $fileArray;

    public function __construct($file)
    {
        $this->position = 0;
        $this->fileArray = file($file);
    }
    
    /*
     * get current line of file
     */
    public function current()
    {
        return $this->fileArray[$this->position];
    }
    
    /*
     * increase the current file position
     */
    public function next()
    {
        ++$this->position;
    }

    /*
     * get current position of file
     */
    public function key()
    {
        return $this->position;
    }

    /*
     * check for the existence of the file position
     */
    public function valid()
    {
        return isset($this->array[$this->position]);
    }

    /*
     * make position of file is 0 (start position)
     */ 
    public function rewind()
    {
        $this->position = 0;
    }
    
    /*
     * change position of file
     */ 
    public function seek($position)
    {
        if (!isset($this->fileArray[$position])) {
            throw new OutOfBoundsException("недействительная позиция поиска ($position)");
        }

        $this->position = $position;
    }

}
