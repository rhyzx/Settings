for name in *.png; do
  mv $name ${name/.png/_2x.png}
done
